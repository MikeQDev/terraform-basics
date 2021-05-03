
// Specify where and how operations are performed
// Also, as below: where state snapshots are stored
// ^ Great for building with team with a shared state file
terraform {
  backend "s3" {
    bucket     = "mybucket"
    key        = "terraform/tfstate.tfstate"
    region     = "us-east-1"
  }
}