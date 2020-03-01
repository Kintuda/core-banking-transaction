mix phx.gen.json Main User users first_name:string last_name:string username:string:unique password:string email:string:unique

mix phx.gen.json Main Accounts accounts description:string routing_number:string

mix phx.gen.schema Adress adresses zipcode:string street:string user_id:references:users ibge_code:string state:string county:string neighborhood:string

mix phx.gen.schema Profile profiles role:string permissions:array:string user_id:references:users

mix phx.gen.schema Deposit deposits amount:decimal account_id:references:accounts

mix phx.gen.schema Withdrawal withdrawals amount:decimal account_id:references:accounts

CREATE TYPE user_status AS ENUM (1, 2, 3);
