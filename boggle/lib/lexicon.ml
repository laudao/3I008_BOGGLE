module M = struct
  include Map.Make (Char)

  let to_iter s=
    fun k ->
      iter (fun key item -> k (key, item)) s
end

type t = {
  eow : bool;
  words : t M.t;
}

let empty =
  (* Cette valeur vous est donnée, vous n'avez pas besoin de l'écrire
     vous-même. *)
  {
    eow = false;
    words = M.empty;
  }

let is_empty { eow; words } =
    failwith "Unimplemented"
(*eow==false && M.for_all empty words*)

(*let rec is_empty { eow; words } =
  if words=empty.words then true else false*)


let has_empty_word { eow; words } =
  failwith "Unimplemented"
(*Iter.filter (fun x -> if x=true then true else false )(Iter.map (fun x -> is_empty { false; x }) M.to_iter words

 match (eow,words) with
  |(false,words) when is_empty {eow; words} = true -> true
  |(false,words) -> has_empty_word {words.eow; words}
  |(true,_)->false*)

let add word lexicon =
	let rec traverse n t =
    if n < String.length word then
		if M.mem word.[n] t.words then
			{eow=t.eow;words=(traverse (n+1) (M.find word.[n] t.words))}
		else
			{eow=t.eow;words=(traverse (n+1) (M.add word.[n] empty (t.words)))}
	else 
		{eow=true;words=t.words}
 in traverse 0 lexicon

let rec to_iter { eow; words } =  
	failwith "Unimplemented"

let letter_suffixes { eow; words } letter =
	let rec traverse n t =
		if M.mem letter t.words then
			{eow=false;words=t.words}
		else
			empty
 in traverse 0 	{ eow; words }

let rec filter_min_length len { eow; words } =
  failwith "Unimplemented"
  (* let mots = (Iter.filter (fun x -> if String.length(x) > len then true else false)(to_iter { eow; words })) in
	let lex = empty in
	Iter.map (fun x -> add x lex) mots *)

let load_file f =
  let rec load_channel channel acc =
    match input_line channel with
    | word -> load_channel channel (add word acc)
    | exception End_of_file -> acc
  in
  match open_in f with
  | channel -> Some (load_channel channel empty)
  | exception Sys_error _ -> None
