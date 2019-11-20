package com.speedment.example.microservices.jlink;

import com.company.sakila.SakilaApplicationBuilder;
import com.company.sakila.sakila.sakila.film.Film;
import com.company.sakila.sakila.sakila.film.FilmManager;
import com.speedment.runtime.core.ApplicationBuilder;
import com.speedment.runtime.core.Speedment;

import java.io.IOException;

public final class Main {

    public static void main(String[] args) throws IOException {

        final Speedment app = new SakilaApplicationBuilder()
            .withPassword("sakila")
            .withLogging(ApplicationBuilder.LogType.STREAM)
            .build();

        final FilmManager films = app.getOrThrow(FilmManager.class);

        System.out.println("These are the ten longest films rated as PG-13:");
        films.stream()
            .filter(Film.RATING.equal("PG-13"))
            .sorted(Film.LENGTH.reversed())
            .limit(10)
            .map(film -> String.format(
                "%-18s %d min",
                film.getTitle(),
                film.getLength().orElse(0))
            )
            .forEach(System.out::println);


        System.gc();
        System.in.read();

    }
}
