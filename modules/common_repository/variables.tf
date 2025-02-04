variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "visibility" {
  type    = string
  default = "public"
}

variable "labels" {
  type = list(object({
    name        = string
    color       = string
    description = string
  }))
  default = []
}

variable "branch_protection" {
  type    = bool
  default = true
}
