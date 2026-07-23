rgs = {
    rg1= {
        name= "cineverers-rg"
        location= "Central India"
    }
}


vnets = {
    vanet1 = {
        name = "cineverse-vnet"
        location = "Central India"
        resource_group_name = "cineverers-rg"
        address_space = ["10.250.0.0/16"]
    } 
}


snets = {
    snet1 = {
        name = "frontend-snet"
        resource_group_name = "cineverers-rg"
        virtual_network_name = "cineverse-vnet"
        address_prefixes = ["10.250.1.0/24"]
    }
    snet2 = {
        name = "backend-snet"
        resource_group_name = "cineverers-rg"
        virtual_network_name = "cineverse-vnet"
        address_prefixes = ["10.250.2.0/24"]
    }

    snet3 = {
        name = "AzureBastionSubnet"
        resource_group_name = "cineverers-rg"
        virtual_network_name = "cineverse-vnet"
        address_prefixes = ["10.250.3.0/24"]
    }

    snet4 = {
        name = "APIGw-snet"
        resource_group_name = "cineverers-rg"
        virtual_network_name = "cineverse-vnet"
        address_prefixes = ["10.250.4.0/24"]
    }
}

pips = {
    pip1 = {
        name = "nat-pip"
        location = "Central India"
        resource_group_name = "cineverers-rg"
        allocation_method = "Static"
    }

    pip2 = {
        name = "bastion-pip"
        location = "Central India"
        resource_group_name = "cineverers-rg"
        allocation_method = "Static"
    }

}

nats = {
    nat1 ={
        name = "vm-nat"
        location = "Central India"
        resource_group_name = "cineverers-rg"
        virtual_network_name = "cineverse-vnet"
        sku_name = "Standard"
        data_frontend_sub_name = "frontend-snet"
        data_backend_sub_name = "backend-snet"
        data_pip_name = "nat-pip"
    }
    #  nat2 ={
    #     name = "backend-nat"
    #     location = "Central India"
    #     resource_group_name = "cineverers-rg"
    #     virtual_network_name = "cineverse-vnet"
    #     sku_name = "Standard"
    #     sub_name = "backend-snet"
    #     data_name = "backend-pip"
    # }
} 

bastion = {
    bastion1 = {
        name = "hostadmin"
        location = "Central India"
        resource_group_name = "cineverers-rg"
        virtual_network_name = "cineverse-vnet"
        data_sub_name = "AzureBastionSubnet"
        data_pip_name = "bastion-pip"

    }
}