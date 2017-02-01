# if using Docker inside Jenkins Container
# substitute /Users.... with path to local directory to hold
# Jenkins config and Force Migration Tool Config. This ensures that config persists if container destroyed
# docker run -d -p 8080:8080 -p 50000:50000 -v /Users/stephenmoss/Development/Jenkins:/var/jenkins_home -v /Users/stephenmoss/Development/SF_CI_Dev/force_tool_config:/var/force_tool_config --name jenkins bladexr8/jenkins

# No Use of Docker in Container
# Substitute jenkins and force migration tool config volume as per notes above
docker run -d -p 8080:8080 -p 50000:50000 -v /Users/stephenmoss/Development/SF_CI_Dev/Jenkins:/var/jenkins_home -v /Users/stephenmoss/Development/SF_CI_Dev/force_tool_config:/var/force_tool_config  --name jenkins bladexr8/jenkins
