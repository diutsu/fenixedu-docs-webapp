package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.groups.Group;

import pt.ist.fenixframework.CallableWithoutException;
import pt.ist.fenixframework.FenixFramework;

public class SetUserAsAdmin {

    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage : SetUserAsAdmin <username>");
        }
        addUserAsAdmin(args[0]);
    }

    private static void addUserAsAdmin(String username) {
        FenixFramework.getTransactionManager().withTransaction(new CallableWithoutException<Void>() {

            @Override
            public Void call() {
                User user = User.findByUsername(username);
                if (user != null) {
                    Group.managers().mutator().changeGroup(Group.users(user));
                    System.out.printf("User %s (%s) added as manager.\n", user.getName(), user.getUsername());
                } else {
                    System.out.printf("Can't find user with username %s .\n", username);
                }
                return null;
            }
        });

    }
}
