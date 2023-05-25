#[contract]
mod balance {
    use starknet::ContractAddress;

    struct Storage{
        balances: LegacyMap::<ContractAddress, u256>,
    }

    #[event]
    fn UpdatedBalance(balances: felt252) {}

    #[view]
    fn read(account: ContractAddress) -> u256 {
        balances::read(account)
    }

    #[external]
    fn write(account: ContractAddress, new_balance: u256){
        balances::write(account, new_balance);
        Update(new_balance)
    }
}
