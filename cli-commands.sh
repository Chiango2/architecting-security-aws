# Load named profile
export AWS_PROFILE=ngong

# Create S3 bucket
aws s3api create-bucket --bucket emmanuelngong.com-cloudfront

# Create and uplaod index.html document
echo "Hello, world!" > index.html
aws s3 cp index.html s3://emmanuelngong.com-cloudfront/

# Create the origin access identity (OAI)
aws cloudfront create-cloud-front-origin-access-identity \
    --cloud-front-origin-access-identity-config \
        CallerReference="demo",Comment="OAI for emmanuengong.com-cloudfront"

# Apply a bucket policy granting read access to the OAI
aws s3api put-bucket-policy --bucket emmanuelngong.com-cloudfront --policy file://bucketpolicy.json

# Verify bucket policy
aws s3api get-bucket-policy --bucket emmanuel.ngong.com-cloudfront

# Create a CloudFront distribution
aws cloudfront create-distribution --distribution-config file://dist-config.json
