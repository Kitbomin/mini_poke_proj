package org.example.myspring.common;

import org.example.myspring.entity.Player;

public class ApiMappingPattern {

    public static final String API = "/api";
    public static final String V1 = "/v1";

    public static final String BASE = API + V1;


    public static final class All {
        private All() {}

        public static final String ROOT = BASE + "/mini-poke";
    }

    public static final class Player {
        private Player() {}

        public static final String PLAYER = BASE + "/{username}/mini-poke";
    }


}
