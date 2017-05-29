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
          "aws:SourceIp":[
            "116.197.184.0/27",
            "116.197.184.64/27",
            "66.129.239.0/27",
            "66.129.239.64/27"
          ]
        }
      },
      "Resource": "arn:aws:es:${region}:${account_id}:domain/${name}/*"
    }
  ]
}