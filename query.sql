create database mini_poke_proj;
use mini_poke_proj;

-- Player
CREATE TABLE player (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pokemon
CREATE TABLE pokemon (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20),
    hp INT,
    attack INT,
    defense INT,
    speed INT
);

-- Player's Pokemon
CREATE TABLE player_pokemon (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    player_id BIGINT,
    pokemon_id BIGINT,
    nickname VARCHAR(50),
    level INT DEFAULT 1,
    exp INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES player(user_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
);

-- Move
CREATE TABLE move (
    move_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20),
    power INT,
    accuracy INT,
    pp INT
);

-- Pokemon can learn Move
CREATE TABLE pokemon_move (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pokemon_id BIGINT,
    move_id BIGINT,
    level_required INT,
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (move_id) REFERENCES move(move_id)
);
