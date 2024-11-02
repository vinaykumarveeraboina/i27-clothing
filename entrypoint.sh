# Script

ENVIRONMENT="${1:-dev}"

case "$ENVIRONMENT" in 
    dev)
        echo "Starting the application in dev mode"
        npm run start:dev
        ;;
    test)
        echo "Starting the application in test mode"
        npm run start:test
        ;;
    stage)
        echo "Starting the application in stage mode"
        npm run start:stage
        ;;
    prod)
        echo "Starting the application in prod mode"
        npm run start:prod
        ;;
esac
