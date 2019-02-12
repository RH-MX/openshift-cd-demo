curl -o /tmp/curl.log -sL -w "%{http_code}" -H "Content-Type: application/json" \
            -u $GOGS_USER:$GOGS_PWD -X POST http://$GOGS_SVC:3000/api/v1/repos/gogs/openshift-tasks/hooks -d @hook.json 
