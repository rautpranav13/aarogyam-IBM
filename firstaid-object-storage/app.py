
import os
import ibm_boto3
from ibm_botocore.client import Config, ClientError
from flask import Flask, request, jsonify

# Flask app
app = Flask(__name__)

COS_API_KEY_ID = 'add your own'
COS_INSTANCE_CRN = 'add your own05:723957e4-ad83-4ede-a66a-eac90fd697af::'
COS_ENDPOINT = 'https://s3.ap.cloud-object-storage.appdomain.cloud'
BUCKET_NAME = 'aarogyamfirstaid'

def create_cos_client():
    """Create an IBM COS client."""
    return ibm_boto3.client(
        's3',
        ibm_api_key_id=COS_API_KEY_ID,
        ibm_service_instance_id=COS_INSTANCE_CRN,
        config=Config(signature_version='oauth'),
        endpoint_url=COS_ENDPOINT
    )

def get_public_url(bucket_name, object_key):
    """Generate the public URL for an object in the bucket."""
    return f"{COS_ENDPOINT}/{bucket_name}/{object_key}"

def list_objects_in_folder(cos_client, bucket_name, folder_name):
    """List objects in the specified folder of the bucket."""
    try:
        response = cos_client.list_objects_v2(Bucket=bucket_name, Prefix=folder_name)
        if 'Contents' in response:
            object_urls = []
            for obj in response['Contents']:
                object_key = obj['Key']
                if object_key.endswith('/'):
                    continue  # Skip folder entries
                public_url = get_public_url(bucket_name, object_key)
                object_urls.append(public_url)
            return object_urls
        else:
            return []
    except ClientError as e:
        print(f"Unable to list objects. Error: {e}")
        return []

@app.route('/list_objects', methods=['GET'])
def list_objects():
    """API Endpoint to list objects in a folder."""
    folder_name = request.args.get('folder_name', '')  # Get folder name from query parameter
    if not folder_name:
        return jsonify({"error": "Folder name is required"}), 400

    cos_client = create_cos_client()
    object_urls = list_objects_in_folder(cos_client, BUCKET_NAME, folder_name)
    return jsonify({"folder": folder_name, "objects": object_urls})

@app.route('/')
def home():
    return "Hello, Welcome to Aarogyam!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
