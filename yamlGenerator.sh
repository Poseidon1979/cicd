cp -r ${WORKSPACE}/helm_template ${WORKSPACE}/${JOB_NAME}_helm_charts

rm ${WORKSPACE}/${JOB_NAME}_helm_charts/templates/*.yaml

sed 's/{{.Values.app.name}}/${JOB_NAME}/g' ${WORKSPACE}/helm_template/templates/image.yaml | sed 's/{{.Values.app.image}}/${client.docker.image}/g' | sed 's/{{.Values.git.url}}/${GIT_URL}/g' | sed 's/{{.Values.git.revision}}/${GIT_COMMIT}/g' >> ${WORKSPACE}/${JOB_NAME}_helm_charts/templates/${JOB_NAME}-image.yaml

sed 's/{{.Values.app.label}}/app=${JOB_NAME}/g' ${WORKSPACE}/helm_template/templates/pod.yaml | sed 's/{{.Values.app.image}}/${client.docker.image}/g' | sed 's/{{.Values.app.name}}/${JOB_NAME}/g' >> ${WORKSPACE}/${JOB_NAME}_helm_charts/templates/${JOB_NAME}-pod.yaml

sed 's/{{.Values.app.label}}/app=${JOB_NAME}/g' ${WORKSPACE}/helm_template/templates/service.yaml | sed 's/{{.Values.app.name}}/${JOB_NAME}/g' >> ${WORKSPACE}/${JOB_NAME}_helm_charts/templates/${JOB_NAME}-service.yaml