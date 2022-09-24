package boundary

import data.resources

# these are there for boundaries list operation
# farmerId is in the request path
# case 1. allow only certain farmer for this advisor to view boundaries for
# group will be associated with a list of farmers for which this advisor can view boundaries for.

filtering[result]  {

    endswith(input.actionId, "Microsoft.AgFoodPlatform/farmbeats/parties/boundaries/list")
    # startswith(input.request.path, "/public")
    input.request.method == "GET"
    # return a list of allowed farmers for which this advisor can access
    input.group == "advisor" 
    eligiblefarmers := ["123", "456"]
    #result = "boundaries"
   
    some k,i    
    input.resources[k].farmerId == eligiblefarmers[i]
    result := input.resources[k]
    
}

