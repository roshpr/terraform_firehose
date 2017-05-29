data "template_file" "access_policy" {
  template = "${file("${path.root}/../template/access_policy.tpl")}"

  vars {
    #elasticsearch_ips_to_allow_access = "${formatlist("\"%s\"", split(",","10.10.10.10,20.20.20.20"))}"
    region = "${var.aws["region"]}"
    account_id = "${var.aws["account_id"]}"
    name = "${var.name}"
  }
}

resource "aws_elasticsearch_domain" "es" {
    domain_name = "${var.name}"
    elasticsearch_version = "${var.es_config["engine_version"]}"
    advanced_options {
        "rest.action.multi.allow_explicit_index" = true
    }

    access_policies = "${data.template_file.access_policy.rendered}"
    cluster_config {
      instance_type = "m4.large.elasticsearch"
      instance_count = 2
      zone_awareness_enabled = true
    }
    ebs_options {
      ebs_enabled = true
      volume_size = 20
    }
    snapshot_options {
        automated_snapshot_start_hour = 23
    }

    tags {
      Domain = "${var.name}"
    }
}