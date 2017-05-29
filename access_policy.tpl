{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": [
            ${"elasticsearch_ips_to_allow_access"}
          ]
        }
      },
      "Resource": "arn:aws:es:${region}:${account_id}:domain/${name}/*"
    }
  ]
}
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": ["10.10.10.10"]
        }
      },
      "Resource": "arn:aws:es:us-east-1:408183818623:domain/eccentral/*"
    }
  ]
}