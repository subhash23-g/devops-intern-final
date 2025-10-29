job "hello" {
  # This line tells Nomad to treat this as a service, meaning it should
  # run all the time and restart if it crashes.
  type = "service"

  # We define where the job will run (e.g., on a data center named "dc1")
  datacenters = ["dc1"]

  # A "group" is a collection of identical tasks.
  group "cache" {

    # The actual program that will run.
    task "hello-task" {

      # This is where you tell Nomad to run your Docker container.
      driver = "docker"

      # This block tells Nomad the minimum resources your container needs.
      resources {
        cpu    = 100  # Allocate 100 MHz of CPU (a very small amount)
        memory = 64   # Allocate 64 MB of RAM (a small amount)
      }

      # This block tells the Docker driver which image to use.
      config {
        # *** IMPORTANT: Replace 'your-docker-image-name' with the actual name of your Docker image! ***
        image = "your-docker-image-name:latest"
      }
    }
  }
}