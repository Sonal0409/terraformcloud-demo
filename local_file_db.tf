resource "local_file" "newfile"{
content = var.password
filename = "password.txt"
}

variable "password" {
sensitive = "true"
default = "supersecretpassword01"
}

resource "local_sensitive-file" "newfile1"{
content = "newfilepassword02
filename = "password-new.txt"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
