cp -r ${JENKINS_HOME}/helm_template ${JENKINS_HOME}/${JOB_NAME}_helm_charts

rm ${JENKINS_HOME}/${JOB_NAME}_helm_charts/cicd_sample/templates/*.yaml

sed 's/{{.Values.app.name}}/"$JOB_NAME"/g' ${JENKINS_HOME}/helm_template/cicd_sample/templates/image.yaml | sed 's/{{.Values.app.image}}/"$client.docker.image"/g' | sed 's/{{.Values.git.url}}/"$GIT_URL"/g' | sed 's/{{.Values.git.revision}}/"$GIT_COMMIT"/g' >> ${JENKINS_HOME}/${JOB_NAME}_helm_charts/cicd_sample/templates/${JOB_NAME}-image.yaml

sed 's/{{.Values.app.label}}/app:"$JOB_NAME"/g' ${JENKINS_HOME}/helm_template/cicd_sample/templates/pod.yaml | sed 's/{{.Values.app.image}}/"$client.docker.image"/g' | sed 's/{{.Values.app.name}}/"$JOB_NAME"/g' >> ${JENKINS_HOME}/${JOB_NAME}_helm_charts/cicd_sample/templates/${JOB_NAME}-pod.yaml

sed 's/{{.Values.app.label}}/app:"$JOB_NAME"/g' ${JENKINS_HOME}/helm_template/cicd_sample/templates/service.yaml | sed 's/{{.Values.service.name}}/"$JOB_NAME"/g' >> ${JENKINS_HOME}/${JOB_NAME}_helm_charts/cicd_sample/templates/${JOB_NAME}-service.yaml