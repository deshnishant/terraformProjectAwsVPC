#### RDS ####
resource "aws_db_subnet_group" "my-db-sub-grp" {
  name       = "three-tier-db-sub-grp"
  subnet_ids = ["${aws_subnet.my-db1-subnet.id}","${aws_subnet.my-db2-subnet.id}"]
}

resource "aws_db_instance" "my-db" {
  allocated_storage           = 100
  storage_type                = "gp3"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t2.micro"
  identifier                  = "my-db"
  username                    = "admin"
  password                    = "23vS5TdDW8*o"
  parameter_group_name        = "default.mysql8.0"
  db_subnet_group_name        = aws_db_subnet_group.my-db-sub-grp.name
  vpc_security_group_ids      = ["${aws_security_group.my-db-sg.id}"]
  multi_az                    = true
  skip_final_snapshot         = true
  publicly_accessible          = false

  lifecycle {
    prevent_destroy = false
    ignore_changes  = all
  }
}