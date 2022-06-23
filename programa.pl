pocion(multijugo,pelo,4).
pocion(deshacerHechizo,mandragora,30).
pocion(suerteLiquida,trebol,5).

objetosMagicos(capaInvisibilidad).
objetosMagicos(piedraResurreccion).
objetosMagicos(varitaSauco).

usa(harry,capaInvisibilidad,3).
usa(harry,capaInvisibilidad,1).
usa(harry,inmobilus,1).
usa(harry,avadaKedavra,7).

usa(hermione,multijugo,3).
usa(hermione,inmobilus,3).

pelicula(1,"HP y la piedra filosofal").

hechizo(inmobilus, facil).
hechizo(avadaKedavra, imperdonable).

usaAlgunHechizo(Mago):-
    usaHechizo(Mago,_).

usaHechizo(Mago,Hechizo):-
    usa(Mago,Hechizo,_),hechizo(Hechizo,_).

usaUnSoloHechizo(Mago):-
    usaAlgunHechizo(Mago),
    noUsaMasDeUnHechizo(Mago).

noUsaMasDeUnHechizo(Mago):-
    not(usaMasDeUnHechizo(Mago)).

usaMasDeUnHechizo(Mago):-
    usaHechizo(Mago,Hechizo1),
    usaHechizo(Mago,Hechizo2),
    Hechizo2 \= Hechizo1.

hechizoQueNadieUsa(Hechizo) :- 
    hechizo(Hechizo,_), 
    not(usa(_,Hechizo,_)).
    
hechizoQueTodosUsan(Hechizo) :- 
    hechizo(Hechizo, _), 
    not(hayUnMagoQueNoLoUsa(Hechizo)).

hayUnMagoQueNoLoUsa(Hechizo):-
    mago(Mago),
    not(usa(Mago,Hechizo,_)).

hechizoQueTodosUsan2(Hechizo) :-
    hechizo(Hechizo, _), 
    forall(mago(Mago),usa(Mago,Hechizo,_)).

seSabeTodasLasPociones(Mago) :- 
    mago(Mago), 
    forall(pocion(Pocion,_,_),usa(Mago, Pocion,_)).

soloSabeDePociones(Mago):-
    mago(Mago), 
    forall(usa(Mago, Pocion,_), pocion(Pocion,_,_)).
