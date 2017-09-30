#!/usr/bin/env bats
#

@test "Second run should change nothing" {
    skip "ensure nfs-kernel-server service running - kitchen/docker"
    run bash -c "ansible-playbook -i /tmp/kitchen/hosts /tmp/kitchen/default.yml -c local | tee /tmp/idempotency.test | grep -q 'changed=0.*failed=0' && exit 0 || exit 1"
    [ "$status" -eq 0 ]
}

