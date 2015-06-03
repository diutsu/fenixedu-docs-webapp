package org.fenixedu.docs.task;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.commons.i18n.LocalizedString;
import org.fenixedu.docs.domain.DirNode;

import pt.ist.fenixframework.FenixFramework;

public class SetUserRepositoriesTask extends CustomTask {

    @Override
    public void runTask() throws Exception {

//        mysql> select oid, name from abstract_file_node where oid_party >> 32 = 105;
//        +---------------+-------------------------------------------------------------------------+
//        | oid           | name                                                                    |
//        +---------------+-------------------------------------------------------------------------+
//        | 7078106223067 | Direcção Recursos Humanos (DRH)                                         |
//        | 7078106223080 | Instituto Superior Técnico (IST)                                        |
//        | 7078106236735 | Comissão Científica do ITN (CCITN)                                      |
//        | 7078106237746 | Direcção de Serviços de Informática (CC. 8401)                          |
//        | 7078106243918 | Instituto Superior Técnico - Investigação e Desenvolvimento (IST-ID)    |
//        | 7078106445256 | Direcção Recursos Humanos_Geral (CC. 6401)                              |
//        | 7078106541458 | Conselho Coordenador de Avaliação dos Docentes (CCAD)                   |
//        +---------------+-------------------------------------------------------------------------+

        String[] reposIds =
                new String[] { "7078106223067", "7078106223080", "7078106236735", "7078106237746", "7078106243918",
                        "7078106445256", "7078106541458" };
        LocalizedString repoType =
                new LocalizedString.Builder().with(Locale.forLanguageTag("en-GB"), "Unit")
                        .with(Locale.forLanguageTag("pt-PT"), "Unidade").build();

        for (String oid : reposIds) {
            DirNode node = FenixFramework.getDomainObject(oid);
            if (FenixFramework.isDomainObjectValid(node)) {
                taskLog(node.getDisplayName());
                node.setRepositoryType(repoType);
                node.setRepositoryRoot(Bennu.getInstance());
                getUsers(node).stream().forEach(node::addRepositoryUser);
                taskLog("\t read: " + node.getReadGroup().getPresentationName());
                taskLog("\t write:" + node.getWriteGroup().getPresentationName());
            }
        }

    }

    private Set<User> getUsers(DirNode node) {
        Set<User> users = new HashSet<>();
        users.addAll(node.getReadGroup().getMembers());
        users.addAll(node.getWriteGroup().getMembers());
        return users;
    }

}
