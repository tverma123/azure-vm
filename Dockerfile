
# FROM python:3.9
# WORKDIR /python-docker
# COPY requirements.txt requirements.txt
# COPY main.py app.py
# RUN pip3 install -r requirements.txt
# COPY . .
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]



FROM python:3.9
WORKDIR /python-docker
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY main.py app.py
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
# Docker
# Build and push an image to Azure Container Registry
# https://docs.microsoft.com/azure/devops/pipelines/languages/docker

# trigger:
#  paths:
#    include:
#      - result/*

# resources:
# - repo: self

# variables:
#   # Container registry service connection established during pipeline creation
#   dockerRegistryServiceConnection: '11c8b50d-0870-421c-9f8a-a4852b156972'
#   imageRepository: 'resultapp'
#   containerRegistry: 'acrtamish.azurecr.io'
#   dockerfilePath: '$(Build.SourcesDirectory)/result/Dockerfile'
#   tag: '$(Build.BuildId)'

#   # Agent VM image name
# pool:
#   name: 'azureagent' 
# stages:
# - stage: Build
#   displayName: Build stage
#   jobs:
#   - job: Build
#     displayName: Build
#     steps:
#     - task: Docker@2
#       displayName: Build and push an image to container registry
#       inputs:
#         containerRegistry: '$(dockerRegistryServiceConnection)'
#         repository: '$(imageRepository)'
#         command: 'build'
#         Dockerfile: 'result/Dockerfile'
#         tags: '$(tag)'

# - stage: Push
#   displayName: Push Stage
#   jobs:
#     - job: Push
#       displayName: Push
#       steps:
#         - task: Docker@2
#           inputs:
#             containerRegistry: 'acrtamish'
#             command: 'push'
#           displayName: Pushing images
          
