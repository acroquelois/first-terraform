variable "owner" {
  type        = string
  description = "Name for owner tag"
}

variable "ami-ID" {
  type = string
  description = "Ami id for instances"
  default =  "ami-059db4e559f0ad913"
}

variable "instance-type" {
  type        = string
  description = "instance_type"
  default     = "t2.micro"
}