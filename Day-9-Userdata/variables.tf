variable "ami_id" {
    description = "Passing ami value"
    default = "ami-0bc7aabcf58d1e02a"
    type =  string
}
variable "type" {
    description = "Passing values for instance"
    default = "t3.micro"
    type = string
}