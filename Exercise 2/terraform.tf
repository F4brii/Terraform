resource "local_file" "products" {
  count    = 5
  content  = "Products"
  filename = "products-${random_string.sufix[count.index].id}.txt"
}

resource "random_string" "sufix" {
  count   = 5
  length  = 4
  special = false
  upper   = false
  numeric = false
}
