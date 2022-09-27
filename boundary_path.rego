package boundary


# these are there for boundaries list operation
# farmerId is in the request path
# case 1. allow only certain farmer for this advisor to view boundaries for
# group will be associated with a list of farmers for which this advisor can view boundaries for.

correctpath  {

    endswith(input.actionId, "Microsoft.AgFoodPlatform/farmbeats/parties/boundaries/read")
    # startswith(input.request.path, "/public")
    input.request.method == "GET"
    # return a list of allowed farmers for which this advisor can access
    input.group == "advisor" 
    eligiblefarmers := ["123"]
    #result = "boundaries"   
    some i  
    contains(input.request.path, eligiblefarmers[i])

}
