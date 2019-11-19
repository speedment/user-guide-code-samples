package com.speedment.example.microservices.jlink;

import com.company.sakila.SakilaApplicationBuilder;
import com.company.sakila.sakila.sakila.film.Film;
import com.company.sakila.sakila.sakila.film.FilmManager;
import com.speedment.runtime.core.Speedment;

public final class Main {

    public static void main(String[] args) {

        System.out.println("Starting...");

        final Speedment app = new SakilaApplicationBuilder()
            .withPassword("sakila-password")
            .build();

        final FilmManager films = app.getOrThrow(FilmManager.class);

        films.stream()
            .filter(Film.RATING.equal("PG-13"))
            .limit(10)
            .forEach(System.out::println);


    }
}
