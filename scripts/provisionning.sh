#!/bin/bash

ALERT=$(tput setaf 3; echo -n "[-] Imperial Intelligence has detected resistance activity..."; tput sgr0)
ATTACK=$(tput setaf 1; echo -n "[!] The Rebel Alliance dares to challenge the Empire!"; tput sgr0)
VICTORY=$(tput setaf 2; echo -n "[✓] The Dark Side prevails! Galactic order is restored."; tput sgr0)

# Battle counter and maximum countermeasures (retries)
STRIKES=0
MAX_DEFENSES=3

# Declare the state of the Empire’s conquest
echo "[+] The Sith Lords have foreseen this battle. Preparing the fleet..."
echo "[+] Deploying the Galactic Domination Protocol for: $LAB"
echo "[+] Reinforcements arriving from: $PROVIDER"

# Setting the Ansible command for executing deployments
if [ -z  "$ANSIBLE_COMMAND" ]; then
  export ANSIBLE_COMMAND="ansible-playbook -i ../ad/$LAB/data/inventory -i ../ad/$LAB/providers/$PROVIDER/inventory"
fi
echo "[+] The Empire’s fleet is ready: $ANSIBLE_COMMAND"

# Function to execute planetary occupation (playbook execution)
function execute_imperial_order {
    if [ $STRIKES -eq $MAX_DEFENSES ]; then
        echo "$ATTACK The Rebel forces have overrun our defenses after $MAX_DEFENSES attempts! The Emperor is displeased."
        exit 2
    fi

    echo "[+] Counterstrike Round: $STRIKES"
    let "STRIKES += 1"

    # Deploying the fleet with a 30-minute engagement limit, unless it's a critical operation (SCCM)
    if [[ $LAB == "SCCM" ]]; then
        echo "$VICTORY Unrestricted deployment in progress: $ANSIBLE_COMMAND $1"
        $ANSIBLE_COMMAND $1
    else
        echo "$VICTORY Deploying Imperial Forces with a 30-minute engagement limit: $ANSIBLE_COMMAND $1"
        timeout 30m $ANSIBLE_COMMAND $1
    fi

    # Assessing the battle outcome
    result=$(echo $?)

    if [ $result -eq 4 ]; then
        echo "$ATTACK A rebel informant has sabotaged communications! Retrying mission: $ANSIBLE_COMMAND $1"
        execute_imperial_order $1

    elif [ $result -eq 124 ]; then
        echo "$ATTACK The fleet has encountered unexpected resistance! Re-engaging: $ANSIBLE_COMMAND $1"
        execute_imperial_order $1

    elif [ $result -eq 0 ]; then
        echo "$VICTORY Another planet falls under Imperial control!"
        STRIKES=0 # Reset counter for the next conquest
        return 0

    else
        echo "$ATTACK A critical system failure! The fleet must regroup. Retrying (error code: $result)"
        execute_imperial_order $1
    fi
}

# Initiate planetary conquest by executing all necessary missions
echo "[+] The Rebel Alliance is attempting to reclaim systems! The Empire must strike first!"
SECONDS=0

case $LAB in
    "SANS")
        echo "[+] Initiating Operation Sith Dominion - The Emperor demands control over this sector!"
        execute_imperial_order build.yml
        execute_imperial_order ad-servers.yml
        execute_imperial_order ad-parent_domain.yml
        execute_imperial_order ad-child_domain.yml
        execute_imperial_order ad-members.yml
        execute_imperial_order ad-trusts.yml
        execute_imperial_order tgtdelegation.yml
        execute_imperial_order ad-data.yml
        execute_imperial_order sans.yml
        execute_imperial_order local-users.yml
        execute_imperial_order security.yml
        ;;
    *)
        echo "$ATTACK Unknown star system detected: $LAB. Imperial forces disengaging."
        exit 1
        ;;
esac

# Final phase - system reboot for galactic stability
echo "[+] The Rebel resistance has been neutralized! Securing the Empire’s control with a final system reboot."
execute_imperial_order reboot.yml
echo "$VICTORY The Galactic Empire is victorious! The remaining Rebel traitors hide in the shadows, awaiting their inevitable fate."
duration=$SECONDS
echo "The operation was completed in $((duration / 60)) minutes and $((duration % 60)) seconds."

# Final mission briefing - challenge to participants
echo ""
echo "⚡⚡⚡ The Empire's dominion is complete! But Rebel operatives remain hidden. Your mission: eliminate them. ⚡⚡⚡"
echo "Embrace the Dark Side, and restore order to the galaxy!"
echo ""
