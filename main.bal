import ballerina/http;
import ballerinax/ai.agent;

listener agent:Listener customer_support_agentListener = new (listenOn = check http:getDefaultListener());

service /customer_support_agent on customer_support_agentListener {
    resource function post chat(@http:Payload agent:ChatReqMessage request) returns agent:ChatRespMessage|error {

        string stringResult = check _customer_support_agentAgent->run(request.message);
        return {message: stringResult};
    }
}
