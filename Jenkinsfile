@Library('DCCSCR@master') _
dccscrPipeline(version: "1.4.2")

pipeline {
  environment {
    IMAGE_NAME = "flannel-cni"
    IMAGE_VERSION = "0.3.0"
    IMAGE_RELEASE = "1"
  }

  stages {
    stage('build-image') {
      when {
        branch 'master'
      }
      steps {
        sh """
        cat /etc/os-release
        buildah bud -t ${IMAGE_NAME}:${IMAGE_VERSION}-${IMAGE_RELEASE} .
        """
      }
    }
  }
}