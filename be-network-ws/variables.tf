variable "aws-region" {
  type    = string
  default = "ap-northeast-1"
}

variable "vpc-cidr" {
  type    = string
  default = "172.22.0.0/16"
}
variable "availability-zone-a" {
  type    = string
  default = "ap-northeast-1a"
}

variable "public-subnet1-cidr" {
  type    = string
  default = "172.22.1.0/24"
}
variable "public-subnet2-cidr" {
  type    = string
  default = "172.22.2.0/24"
}
variable "public-subnet3-cidr" {
  type    = string
  default = "172.22.3.0/24"
}

variable "private-subnet1-cidr" {
  type    = string
  default = "172.22.253.0/24"
}
variable "private-subnet2-cidr" {
  type    = string
  default = "172.22.254.0/24"
}
variable "private-subnet3-cidr" {
  type    = string
  default = "172.22.255.0/24"
}

