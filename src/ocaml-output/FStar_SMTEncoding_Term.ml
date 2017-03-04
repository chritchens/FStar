open Prims
type sort =
  | Bool_sort
  | Int_sort
  | String_sort
  | Ref_sort
  | Term_sort
  | Fuel_sort
  | Array of (sort* sort)
  | Arrow of (sort* sort)
  | Sort of Prims.string
let uu___is_Bool_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Bool_sort  -> true | uu____17 -> false
let uu___is_Int_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Int_sort  -> true | uu____21 -> false
let uu___is_String_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | String_sort  -> true | uu____25 -> false
let uu___is_Ref_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Ref_sort  -> true | uu____29 -> false
let uu___is_Term_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Term_sort  -> true | uu____33 -> false
let uu___is_Fuel_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Fuel_sort  -> true | uu____37 -> false
let uu___is_Array: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Array _0 -> true | uu____44 -> false
let __proj__Array__item___0: sort -> (sort* sort) =
  fun projectee  -> match projectee with | Array _0 -> _0
let uu___is_Arrow: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Arrow _0 -> true | uu____64 -> false
let __proj__Arrow__item___0: sort -> (sort* sort) =
  fun projectee  -> match projectee with | Arrow _0 -> _0
let uu___is_Sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Sort _0 -> true | uu____82 -> false
let __proj__Sort__item___0: sort -> Prims.string =
  fun projectee  -> match projectee with | Sort _0 -> _0
let rec strSort: sort -> Prims.string =
  fun x  ->
    match x with
    | Bool_sort  -> "Bool"
    | Int_sort  -> "Int"
    | Term_sort  -> "Term"
    | String_sort  -> "FString"
    | Ref_sort  -> "Ref"
    | Fuel_sort  -> "Fuel"
    | Array (s1,s2) ->
        let _0_177 = strSort s1 in
        let _0_176 = strSort s2 in
        FStar_Util.format2 "(Array %s %s)" _0_177 _0_176
    | Arrow (s1,s2) ->
        let _0_179 = strSort s1 in
        let _0_178 = strSort s2 in
        FStar_Util.format2 "(%s -> %s)" _0_179 _0_178
    | Sort s -> s
type op =
  | TrueOp
  | FalseOp
  | Not
  | And
  | Or
  | Imp
  | Iff
  | Eq
  | LT
  | LTE
  | GT
  | GTE
  | Add
  | Sub
  | Div
  | Mul
  | Minus
  | Mod
  | ITE
  | Var of Prims.string
let uu___is_TrueOp: op -> Prims.bool =
  fun projectee  ->
    match projectee with | TrueOp  -> true | uu____104 -> false
let uu___is_FalseOp: op -> Prims.bool =
  fun projectee  ->
    match projectee with | FalseOp  -> true | uu____108 -> false
let uu___is_Not: op -> Prims.bool =
  fun projectee  -> match projectee with | Not  -> true | uu____112 -> false
let uu___is_And: op -> Prims.bool =
  fun projectee  -> match projectee with | And  -> true | uu____116 -> false
let uu___is_Or: op -> Prims.bool =
  fun projectee  -> match projectee with | Or  -> true | uu____120 -> false
let uu___is_Imp: op -> Prims.bool =
  fun projectee  -> match projectee with | Imp  -> true | uu____124 -> false
let uu___is_Iff: op -> Prims.bool =
  fun projectee  -> match projectee with | Iff  -> true | uu____128 -> false
let uu___is_Eq: op -> Prims.bool =
  fun projectee  -> match projectee with | Eq  -> true | uu____132 -> false
let uu___is_LT: op -> Prims.bool =
  fun projectee  -> match projectee with | LT  -> true | uu____136 -> false
let uu___is_LTE: op -> Prims.bool =
  fun projectee  -> match projectee with | LTE  -> true | uu____140 -> false
let uu___is_GT: op -> Prims.bool =
  fun projectee  -> match projectee with | GT  -> true | uu____144 -> false
let uu___is_GTE: op -> Prims.bool =
  fun projectee  -> match projectee with | GTE  -> true | uu____148 -> false
let uu___is_Add: op -> Prims.bool =
  fun projectee  -> match projectee with | Add  -> true | uu____152 -> false
let uu___is_Sub: op -> Prims.bool =
  fun projectee  -> match projectee with | Sub  -> true | uu____156 -> false
let uu___is_Div: op -> Prims.bool =
  fun projectee  -> match projectee with | Div  -> true | uu____160 -> false
let uu___is_Mul: op -> Prims.bool =
  fun projectee  -> match projectee with | Mul  -> true | uu____164 -> false
let uu___is_Minus: op -> Prims.bool =
  fun projectee  ->
    match projectee with | Minus  -> true | uu____168 -> false
let uu___is_Mod: op -> Prims.bool =
  fun projectee  -> match projectee with | Mod  -> true | uu____172 -> false
let uu___is_ITE: op -> Prims.bool =
  fun projectee  -> match projectee with | ITE  -> true | uu____176 -> false
let uu___is_Var: op -> Prims.bool =
  fun projectee  ->
    match projectee with | Var _0 -> true | uu____181 -> false
let __proj__Var__item___0: op -> Prims.string =
  fun projectee  -> match projectee with | Var _0 -> _0
type qop =
  | Forall
  | Exists
let uu___is_Forall: qop -> Prims.bool =
  fun projectee  ->
    match projectee with | Forall  -> true | uu____192 -> false
let uu___is_Exists: qop -> Prims.bool =
  fun projectee  ->
    match projectee with | Exists  -> true | uu____196 -> false
type term' =
  | Integer of Prims.string
  | BoundV of Prims.int
  | FreeV of (Prims.string* sort)
  | App of (op* term Prims.list)
  | Quant of (qop* term Prims.list Prims.list* Prims.int Prims.option* sort
  Prims.list* term)
  | Labeled of (term* Prims.string* FStar_Range.range)
  | LblPos of (term* Prims.string)
and term =
  {
  tm: term';
  freevars: (Prims.string* sort) Prims.list FStar_Syntax_Syntax.memo;
  rng: FStar_Range.range;}
let uu___is_Integer: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | Integer _0 -> true | uu____255 -> false
let __proj__Integer__item___0: term' -> Prims.string =
  fun projectee  -> match projectee with | Integer _0 -> _0
let uu___is_BoundV: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | BoundV _0 -> true | uu____267 -> false
let __proj__BoundV__item___0: term' -> Prims.int =
  fun projectee  -> match projectee with | BoundV _0 -> _0
let uu___is_FreeV: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | FreeV _0 -> true | uu____281 -> false
let __proj__FreeV__item___0: term' -> (Prims.string* sort) =
  fun projectee  -> match projectee with | FreeV _0 -> _0
let uu___is_App: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | App _0 -> true | uu____302 -> false
let __proj__App__item___0: term' -> (op* term Prims.list) =
  fun projectee  -> match projectee with | App _0 -> _0
let uu___is_Quant: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | Quant _0 -> true | uu____332 -> false
let __proj__Quant__item___0:
  term' ->
    (qop* term Prims.list Prims.list* Prims.int Prims.option* sort
      Prims.list* term)
  = fun projectee  -> match projectee with | Quant _0 -> _0
let uu___is_Labeled: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | Labeled _0 -> true | uu____374 -> false
let __proj__Labeled__item___0:
  term' -> (term* Prims.string* FStar_Range.range) =
  fun projectee  -> match projectee with | Labeled _0 -> _0
let uu___is_LblPos: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | LblPos _0 -> true | uu____397 -> false
let __proj__LblPos__item___0: term' -> (term* Prims.string) =
  fun projectee  -> match projectee with | LblPos _0 -> _0
type pat = term
type fv = (Prims.string* sort)
type fvs = (Prims.string* sort) Prims.list
type caption = Prims.string Prims.option
type binders = (Prims.string* sort) Prims.list
type constructor_field = (Prims.string* sort* Prims.bool)
type constructor_t =
  (Prims.string* constructor_field Prims.list* sort* Prims.int* Prims.bool)
type constructors = constructor_t Prims.list
type decl =
  | DefPrelude
  | DeclFun of (Prims.string* sort Prims.list* sort* caption)
  | DefineFun of (Prims.string* sort Prims.list* sort* term* caption)
  | Assume of (term* caption* Prims.string Prims.option)
  | Caption of Prims.string
  | Eval of term
  | Echo of Prims.string
  | Push
  | Pop
  | CheckSat
  | GetUnsatCore
  | SetOption of (Prims.string* Prims.string)
  | PrintStats
let uu___is_DefPrelude: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | DefPrelude  -> true | uu____493 -> false
let uu___is_DeclFun: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | DeclFun _0 -> true | uu____503 -> false
let __proj__DeclFun__item___0:
  decl -> (Prims.string* sort Prims.list* sort* caption) =
  fun projectee  -> match projectee with | DeclFun _0 -> _0
let uu___is_DefineFun: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | DefineFun _0 -> true | uu____536 -> false
let __proj__DefineFun__item___0:
  decl -> (Prims.string* sort Prims.list* sort* term* caption) =
  fun projectee  -> match projectee with | DefineFun _0 -> _0
let uu___is_Assume: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Assume _0 -> true | uu____570 -> false
let __proj__Assume__item___0:
  decl -> (term* caption* Prims.string Prims.option) =
  fun projectee  -> match projectee with | Assume _0 -> _0
let uu___is_Caption: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Caption _0 -> true | uu____594 -> false
let __proj__Caption__item___0: decl -> Prims.string =
  fun projectee  -> match projectee with | Caption _0 -> _0
let uu___is_Eval: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Eval _0 -> true | uu____606 -> false
let __proj__Eval__item___0: decl -> term =
  fun projectee  -> match projectee with | Eval _0 -> _0
let uu___is_Echo: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Echo _0 -> true | uu____618 -> false
let __proj__Echo__item___0: decl -> Prims.string =
  fun projectee  -> match projectee with | Echo _0 -> _0
let uu___is_Push: decl -> Prims.bool =
  fun projectee  -> match projectee with | Push  -> true | uu____629 -> false
let uu___is_Pop: decl -> Prims.bool =
  fun projectee  -> match projectee with | Pop  -> true | uu____633 -> false
let uu___is_CheckSat: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | CheckSat  -> true | uu____637 -> false
let uu___is_GetUnsatCore: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | GetUnsatCore  -> true | uu____641 -> false
let uu___is_SetOption: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | SetOption _0 -> true | uu____648 -> false
let __proj__SetOption__item___0: decl -> (Prims.string* Prims.string) =
  fun projectee  -> match projectee with | SetOption _0 -> _0
let uu___is_PrintStats: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | PrintStats  -> true | uu____665 -> false
type decls_t = decl Prims.list
type error_label = (fv* Prims.string* FStar_Range.range)
type error_labels = error_label Prims.list
let fv_eq: fv -> fv -> Prims.bool =
  fun x  -> fun y  -> (Prims.fst x) = (Prims.fst y)
let fv_sort x = Prims.snd x
let freevar_eq: term -> term -> Prims.bool =
  fun x  ->
    fun y  ->
      match ((x.tm), (y.tm)) with
      | (FreeV x,FreeV y) -> fv_eq x y
      | uu____702 -> false
let freevar_sort: term -> sort =
  fun uu___82_707  ->
    match uu___82_707 with
    | { tm = FreeV x; freevars = uu____709; rng = uu____710;_} -> fv_sort x
    | uu____717 -> failwith "impossible"
let fv_of_term: term -> fv =
  fun uu___83_720  ->
    match uu___83_720 with
    | { tm = FreeV fv; freevars = uu____722; rng = uu____723;_} -> fv
    | uu____730 -> failwith "impossible"
let rec freevars: term -> (Prims.string* sort) Prims.list =
  fun t  ->
    match t.tm with
    | Integer _|BoundV _ -> []
    | FreeV fv -> [fv]
    | App (uu____751,tms) -> FStar_List.collect freevars tms
    | Quant (_,_,_,_,t)|Labeled (t,_,_)|LblPos (t,_) -> freevars t
let free_variables: term -> fvs =
  fun t  ->
    let uu____772 = FStar_ST.read t.freevars in
    match uu____772 with
    | Some b -> b
    | None  ->
        let fvs =
          let _0_180 = freevars t in FStar_Util.remove_dups fv_eq _0_180 in
        (FStar_ST.write t.freevars (Some fvs); fvs)
let qop_to_string: qop -> Prims.string =
  fun uu___84_805  ->
    match uu___84_805 with | Forall  -> "forall" | Exists  -> "exists"
let op_to_string: op -> Prims.string =
  fun uu___85_808  ->
    match uu___85_808 with
    | TrueOp  -> "true"
    | FalseOp  -> "false"
    | Not  -> "not"
    | And  -> "and"
    | Or  -> "or"
    | Imp  -> "implies"
    | Iff  -> "iff"
    | Eq  -> "="
    | LT  -> "<"
    | LTE  -> "<="
    | GT  -> ">"
    | GTE  -> ">="
    | Add  -> "+"
    | Sub  -> "-"
    | Div  -> "div"
    | Mul  -> "*"
    | Minus  -> "-"
    | Mod  -> "mod"
    | ITE  -> "ite"
    | Var s -> s
let weightToSmt: Prims.int Prims.option -> Prims.string =
  fun uu___86_813  ->
    match uu___86_813 with
    | None  -> ""
    | Some i ->
        let _0_181 = FStar_Util.string_of_int i in
        FStar_Util.format1 ":weight %s\n" _0_181
let rec hash_of_term': term' -> Prims.string =
  fun t  ->
    match t with
    | Integer i -> i
    | BoundV i ->
        let _0_182 = FStar_Util.string_of_int i in Prims.strcat "@" _0_182
    | FreeV x ->
        let _0_184 =
          let _0_183 = strSort (Prims.snd x) in Prims.strcat ":" _0_183 in
        Prims.strcat (Prims.fst x) _0_184
    | App (op,tms) ->
        let _0_188 =
          let _0_187 =
            let _0_186 =
              let _0_185 = FStar_List.map hash_of_term tms in
              FStar_All.pipe_right _0_185 (FStar_String.concat " ") in
            Prims.strcat _0_186 ")" in
          Prims.strcat (op_to_string op) _0_187 in
        Prims.strcat "(" _0_188
    | Labeled (t,r1,r2) ->
        let _0_191 = hash_of_term t in
        let _0_190 =
          let _0_189 = FStar_Range.string_of_range r2 in
          Prims.strcat r1 _0_189 in
        Prims.strcat _0_191 _0_190
    | LblPos (t,r) ->
        let _0_193 =
          let _0_192 = hash_of_term t in
          Prims.strcat _0_192 (Prims.strcat " :lblpos " (Prims.strcat r ")")) in
        Prims.strcat "(! " _0_193
    | Quant (qop,pats,wopt,sorts,body) ->
        let _0_209 =
          let _0_208 =
            let _0_207 =
              let _0_206 =
                let _0_194 = FStar_List.map strSort sorts in
                FStar_All.pipe_right _0_194 (FStar_String.concat " ") in
              let _0_205 =
                let _0_204 =
                  let _0_203 = hash_of_term body in
                  let _0_202 =
                    let _0_201 =
                      let _0_200 = weightToSmt wopt in
                      let _0_199 =
                        let _0_198 =
                          let _0_197 =
                            let _0_196 =
                              FStar_All.pipe_right pats
                                (FStar_List.map
                                   (fun pats  ->
                                      let _0_195 =
                                        FStar_List.map hash_of_term pats in
                                      FStar_All.pipe_right _0_195
                                        (FStar_String.concat " "))) in
                            FStar_All.pipe_right _0_196
                              (FStar_String.concat "; ") in
                          Prims.strcat _0_197 "))" in
                        Prims.strcat " " _0_198 in
                      Prims.strcat _0_200 _0_199 in
                    Prims.strcat " " _0_201 in
                  Prims.strcat _0_203 _0_202 in
                Prims.strcat ")(! " _0_204 in
              Prims.strcat _0_206 _0_205 in
            Prims.strcat " (" _0_207 in
          Prims.strcat (qop_to_string qop) _0_208 in
        Prims.strcat "(" _0_209
and hash_of_term: term -> Prims.string = fun tm  -> hash_of_term' tm.tm
let mk: term' -> FStar_Range.range -> term =
  fun t  ->
    fun r  ->
      let _0_210 = FStar_Util.mk_ref None in
      { tm = t; freevars = _0_210; rng = r }
let mkTrue: FStar_Range.range -> term = fun r  -> mk (App (TrueOp, [])) r
let mkFalse: FStar_Range.range -> term = fun r  -> mk (App (FalseOp, [])) r
let mkInteger: Prims.string -> FStar_Range.range -> term =
  fun i  ->
    fun r  ->
      let _0_211 = Integer (FStar_Util.ensure_decimal i) in mk _0_211 r
let mkInteger': Prims.int -> FStar_Range.range -> term =
  fun i  ->
    fun r  -> let _0_212 = FStar_Util.string_of_int i in mkInteger _0_212 r
let mkBoundV: Prims.int -> FStar_Range.range -> term =
  fun i  -> fun r  -> mk (BoundV i) r
let mkFreeV: (Prims.string* sort) -> FStar_Range.range -> term =
  fun x  -> fun r  -> mk (FreeV x) r
let mkApp': (op* term Prims.list) -> FStar_Range.range -> term =
  fun f  -> fun r  -> mk (App f) r
let mkApp: (Prims.string* term Prims.list) -> FStar_Range.range -> term =
  fun uu____929  ->
    fun r  -> match uu____929 with | (s,args) -> mk (App ((Var s), args)) r
let mkNot: term -> FStar_Range.range -> term =
  fun t  ->
    fun r  ->
      match t.tm with
      | App (TrueOp ,uu____945) -> mkFalse r
      | App (FalseOp ,uu____948) -> mkTrue r
      | uu____951 -> mkApp' (Not, [t]) r
let mkAnd: (term* term) -> FStar_Range.range -> term =
  fun uu____959  ->
    fun r  ->
      match uu____959 with
      | (t1,t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (TrueOp ,uu____965),uu____966) -> t2
           | (uu____969,App (TrueOp ,uu____970)) -> t1
           | (App (FalseOp ,_),_)|(_,App (FalseOp ,_)) -> mkFalse r
           | (App (And ,ts1),App (And ,ts2)) ->
               mkApp' (And, (FStar_List.append ts1 ts2)) r
           | (uu____986,App (And ,ts2)) -> mkApp' (And, (t1 :: ts2)) r
           | (App (And ,ts1),uu____992) ->
               mkApp' (And, (FStar_List.append ts1 [t2])) r
           | uu____996 -> mkApp' (And, [t1; t2]) r)
let mkOr: (term* term) -> FStar_Range.range -> term =
  fun uu____1006  ->
    fun r  ->
      match uu____1006 with
      | (t1,t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (TrueOp ,_),_)|(_,App (TrueOp ,_)) -> mkTrue r
           | (App (FalseOp ,uu____1018),uu____1019) -> t2
           | (uu____1022,App (FalseOp ,uu____1023)) -> t1
           | (App (Or ,ts1),App (Or ,ts2)) ->
               mkApp' (Or, (FStar_List.append ts1 ts2)) r
           | (uu____1033,App (Or ,ts2)) -> mkApp' (Or, (t1 :: ts2)) r
           | (App (Or ,ts1),uu____1039) ->
               mkApp' (Or, (FStar_List.append ts1 [t2])) r
           | uu____1043 -> mkApp' (Or, [t1; t2]) r)
let mkImp: (term* term) -> FStar_Range.range -> term =
  fun uu____1053  ->
    fun r  ->
      match uu____1053 with
      | (t1,t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (_,App (TrueOp ,_))|(App (FalseOp ,_),_) -> mkTrue r
           | (App (TrueOp ,uu____1065),uu____1066) -> t2
           | (uu____1069,App (Imp ,t1'::t2'::[])) ->
               let _0_215 =
                 let _0_214 = let _0_213 = mkAnd (t1, t1') r in [_0_213; t2'] in
                 (Imp, _0_214) in
               mkApp' _0_215 r
           | uu____1074 -> mkApp' (Imp, [t1; t2]) r)
let mk_bin_op: op -> (term* term) -> FStar_Range.range -> term =
  fun op  ->
    fun uu____1087  ->
      fun r  -> match uu____1087 with | (t1,t2) -> mkApp' (op, [t1; t2]) r
let mkMinus: term -> FStar_Range.range -> term =
  fun t  -> fun r  -> mkApp' (Minus, [t]) r
let mkIff: (term* term) -> FStar_Range.range -> term = mk_bin_op Iff
let mkEq: (term* term) -> FStar_Range.range -> term = mk_bin_op Eq
let mkLT: (term* term) -> FStar_Range.range -> term = mk_bin_op LT
let mkLTE: (term* term) -> FStar_Range.range -> term = mk_bin_op LTE
let mkGT: (term* term) -> FStar_Range.range -> term = mk_bin_op GT
let mkGTE: (term* term) -> FStar_Range.range -> term = mk_bin_op GTE
let mkAdd: (term* term) -> FStar_Range.range -> term = mk_bin_op Add
let mkSub: (term* term) -> FStar_Range.range -> term = mk_bin_op Sub
let mkDiv: (term* term) -> FStar_Range.range -> term = mk_bin_op Div
let mkMul: (term* term) -> FStar_Range.range -> term = mk_bin_op Mul
let mkMod: (term* term) -> FStar_Range.range -> term = mk_bin_op Mod
let mkITE: (term* term* term) -> FStar_Range.range -> term =
  fun uu____1174  ->
    fun r  ->
      match uu____1174 with
      | (t1,t2,t3) ->
          (match ((t2.tm), (t3.tm)) with
           | (App (TrueOp ,uu____1182),App (TrueOp ,uu____1183)) -> mkTrue r
           | (App (TrueOp ,uu____1188),uu____1189) ->
               let _0_217 = let _0_216 = mkNot t1 t1.rng in (_0_216, t3) in
               mkImp _0_217 r
           | (uu____1192,App (TrueOp ,uu____1193)) -> mkImp (t1, t2) r
           | (uu____1196,uu____1197) -> mkApp' (ITE, [t1; t2; t3]) r)
let mkCases: term Prims.list -> FStar_Range.range -> term =
  fun t  ->
    fun r  ->
      match t with
      | [] -> failwith "Impos"
      | hd::tl ->
          FStar_List.fold_left (fun out  -> fun t  -> mkAnd (out, t) r) hd tl
let mkQuant:
  (qop* term Prims.list Prims.list* Prims.int Prims.option* sort Prims.list*
    term) -> FStar_Range.range -> term
  =
  fun uu____1225  ->
    fun r  ->
      match uu____1225 with
      | (qop,pats,wopt,vars,body) ->
          if (FStar_List.length vars) = (Prims.parse_int "0")
          then body
          else
            (match body.tm with
             | App (TrueOp ,uu____1252) -> body
             | uu____1255 -> mk (Quant (qop, pats, wopt, vars, body)) r)
let abstr: fv Prims.list -> term -> term =
  fun fvs  ->
    fun t  ->
      let nvars = FStar_List.length fvs in
      let index_of fv =
        let uu____1275 = FStar_Util.try_find_index (fv_eq fv) fvs in
        match uu____1275 with
        | None  -> None
        | Some i -> Some (nvars - (i + (Prims.parse_int "1"))) in
      let rec aux ix t =
        let uu____1289 = FStar_ST.read t.freevars in
        match uu____1289 with
        | Some [] -> t
        | uu____1305 ->
            (match t.tm with
             | Integer _|BoundV _ -> t
             | FreeV x ->
                 let uu____1315 = index_of x in
                 (match uu____1315 with
                  | None  -> t
                  | Some i -> mkBoundV (i + ix) t.rng)
             | App (op,tms) ->
                 let _0_219 =
                   let _0_218 = FStar_List.map (aux ix) tms in (op, _0_218) in
                 mkApp' _0_219 t.rng
             | Labeled (t,r1,r2) ->
                 let _0_221 =
                   Labeled (let _0_220 = aux ix t in (_0_220, r1, r2)) in
                 mk _0_221 t.rng
             | LblPos (t,r) ->
                 let _0_223 = LblPos (let _0_222 = aux ix t in (_0_222, r)) in
                 mk _0_223 t.rng
             | Quant (qop,pats,wopt,vars,body) ->
                 let n = FStar_List.length vars in
                 let _0_226 =
                   let _0_225 =
                     FStar_All.pipe_right pats
                       (FStar_List.map (FStar_List.map (aux (ix + n)))) in
                   let _0_224 = aux (ix + n) body in
                   (qop, _0_225, wopt, vars, _0_224) in
                 mkQuant _0_226 t.rng) in
      aux (Prims.parse_int "0") t
let inst: term Prims.list -> term -> term =
  fun tms  ->
    fun t  ->
      let tms = FStar_List.rev tms in
      let n = FStar_List.length tms in
      let rec aux shift t =
        match t.tm with
        | Integer _|FreeV _ -> t
        | BoundV i ->
            if ((Prims.parse_int "0") <= (i - shift)) && ((i - shift) < n)
            then FStar_List.nth tms (i - shift)
            else t
        | App (op,tms) ->
            let _0_228 =
              let _0_227 = FStar_List.map (aux shift) tms in (op, _0_227) in
            mkApp' _0_228 t.rng
        | Labeled (t,r1,r2) ->
            let _0_230 =
              Labeled (let _0_229 = aux shift t in (_0_229, r1, r2)) in
            mk _0_230 t.rng
        | LblPos (t,r) ->
            let _0_232 = LblPos (let _0_231 = aux shift t in (_0_231, r)) in
            mk _0_232 t.rng
        | Quant (qop,pats,wopt,vars,body) ->
            let m = FStar_List.length vars in
            let shift = shift + m in
            let _0_235 =
              let _0_234 =
                FStar_All.pipe_right pats
                  (FStar_List.map (FStar_List.map (aux shift))) in
              let _0_233 = aux shift body in
              (qop, _0_234, wopt, vars, _0_233) in
            mkQuant _0_235 t.rng in
      aux (Prims.parse_int "0") t
let subst: term -> fv -> term -> term =
  fun t  -> fun fv  -> fun s  -> let _0_236 = abstr [fv] t in inst [s] _0_236
let mkQuant':
  (qop* term Prims.list Prims.list* Prims.int Prims.option* fv Prims.list*
    term) -> FStar_Range.range -> term
  =
  fun uu____1442  ->
    match uu____1442 with
    | (qop,pats,wopt,vars,body) ->
        mkQuant
          (let _0_239 =
             FStar_All.pipe_right pats
               (FStar_List.map (FStar_List.map (abstr vars))) in
           let _0_238 = FStar_List.map fv_sort vars in
           let _0_237 = abstr vars body in
           (qop, _0_239, wopt, _0_238, _0_237))
let mkForall'':
  (pat Prims.list Prims.list* Prims.int Prims.option* sort Prims.list* term)
    -> FStar_Range.range -> term
  =
  fun uu____1491  ->
    fun r  ->
      match uu____1491 with
      | (pats,wopt,sorts,body) -> mkQuant (Forall, pats, wopt, sorts, body) r
let mkForall':
  (pat Prims.list Prims.list* Prims.int Prims.option* fvs* term) ->
    FStar_Range.range -> term
  =
  fun uu____1528  ->
    fun r  ->
      match uu____1528 with
      | (pats,wopt,vars,body) ->
          (mkQuant' (Forall, pats, wopt, vars, body)) r
let mkForall:
  (pat Prims.list Prims.list* fvs* term) -> FStar_Range.range -> term =
  fun uu____1559  ->
    fun r  ->
      match uu____1559 with
      | (pats,vars,body) -> (mkQuant' (Forall, pats, None, vars, body)) r
let mkExists:
  (pat Prims.list Prims.list* fvs* term) -> FStar_Range.range -> term =
  fun uu____1585  ->
    fun r  ->
      match uu____1585 with
      | (pats,vars,body) -> (mkQuant' (Exists, pats, None, vars, body)) r
let norng: FStar_Range.range = FStar_Range.dummyRange
let mkDefineFun:
  (Prims.string* (Prims.string* sort) Prims.list* sort* term* caption) ->
    decl
  =
  fun uu____1612  ->
    match uu____1612 with
    | (nm,vars,s,tm,c) ->
        DefineFun
          (let _0_241 = FStar_List.map fv_sort vars in
           let _0_240 = abstr vars tm in (nm, _0_241, s, _0_240, c))
let constr_id_of_sort: sort -> Prims.string =
  fun sort  ->
    let _0_242 = strSort sort in FStar_Util.format1 "%s_constr_id" _0_242
let fresh_token: (Prims.string* sort) -> Prims.int -> decl =
  fun uu____1644  ->
    fun id  ->
      match uu____1644 with
      | (tok_name,sort) ->
          let a_name = Prims.strcat "fresh_token_" tok_name in
          Assume
            (let _0_250 =
               let _0_249 =
                 let _0_248 = mkInteger' id norng in
                 let _0_247 =
                   let _0_246 =
                     let _0_245 = constr_id_of_sort sort in
                     let _0_244 =
                       let _0_243 = mkApp (tok_name, []) norng in [_0_243] in
                     (_0_245, _0_244) in
                   mkApp _0_246 norng in
                 (_0_248, _0_247) in
               mkEq _0_249 norng in
             (_0_250, (Some "fresh token"), (Some a_name)))
let fresh_constructor:
  (Prims.string* sort Prims.list* sort* Prims.int) -> decl =
  fun uu____1662  ->
    match uu____1662 with
    | (name,arg_sorts,sort,id) ->
        let id = FStar_Util.string_of_int id in
        let bvars =
          FStar_All.pipe_right arg_sorts
            (FStar_List.mapi
               (fun i  ->
                  fun s  ->
                    let _0_253 =
                      let _0_252 =
                        let _0_251 = FStar_Util.string_of_int i in
                        Prims.strcat "x_" _0_251 in
                      (_0_252, s) in
                    mkFreeV _0_253 norng)) in
        let bvar_names = FStar_List.map fv_of_term bvars in
        let capp = mkApp (name, bvars) norng in
        let cid_app =
          let _0_255 =
            let _0_254 = constr_id_of_sort sort in (_0_254, [capp]) in
          mkApp _0_255 norng in
        let a_name = Prims.strcat "constructor_distinct_" name in
        Assume
          (let _0_260 =
             let _0_259 =
               let _0_258 =
                 let _0_257 =
                   let _0_256 = mkInteger id norng in (_0_256, cid_app) in
                 mkEq _0_257 norng in
               ([[capp]], bvar_names, _0_258) in
             mkForall _0_259 norng in
           (_0_260, (Some "Constructor distinct"), (Some a_name)))
let injective_constructor:
  (Prims.string* constructor_field Prims.list* sort) -> decl Prims.list =
  fun uu____1701  ->
    match uu____1701 with
    | (name,fields,sort) ->
        let n_bvars = FStar_List.length fields in
        let bvar_name i =
          let _0_261 = FStar_Util.string_of_int i in Prims.strcat "x_" _0_261 in
        let bvar_index i = n_bvars - (i + (Prims.parse_int "1")) in
        let bvar i s = mkFreeV (let _0_262 = bvar_name i in (_0_262, s)) in
        let bvars =
          FStar_All.pipe_right fields
            (FStar_List.mapi
               (fun i  ->
                  fun uu____1741  ->
                    match uu____1741 with
                    | (uu____1745,s,uu____1747) -> (bvar i s) norng)) in
        let bvar_names = FStar_List.map fv_of_term bvars in
        let capp = mkApp (name, bvars) norng in
        let _0_270 =
          FStar_All.pipe_right fields
            (FStar_List.mapi
               (fun i  ->
                  fun uu____1763  ->
                    match uu____1763 with
                    | (name,s,projectible) ->
                        let cproj_app = mkApp (name, [capp]) norng in
                        let proj_name =
                          DeclFun (name, [sort], s, (Some "Projector")) in
                        if projectible
                        then
                          let a_name =
                            Prims.strcat "projection_inverse_" name in
                          let _0_269 =
                            let _0_268 =
                              Assume
                                (let _0_267 =
                                   let _0_266 =
                                     let _0_265 =
                                       let _0_264 =
                                         let _0_263 = (bvar i s) norng in
                                         (cproj_app, _0_263) in
                                       mkEq _0_264 norng in
                                     ([[capp]], bvar_names, _0_265) in
                                   mkForall _0_266 norng in
                                 (_0_267, (Some "Projection inverse"),
                                   (Some a_name))) in
                            [_0_268] in
                          proj_name :: _0_269
                        else [proj_name])) in
        FStar_All.pipe_right _0_270 FStar_List.flatten
let constructor_to_decl: constructor_t -> decl Prims.list =
  fun uu____1788  ->
    match uu____1788 with
    | (name,fields,sort,id,injective) ->
        let injective = injective || true in
        let field_sorts =
          FStar_All.pipe_right fields
            (FStar_List.map
               (fun uu____1804  ->
                  match uu____1804 with
                  | (uu____1808,sort,uu____1810) -> sort)) in
        let cdecl = DeclFun (name, field_sorts, sort, (Some "Constructor")) in
        let cid = fresh_constructor (name, field_sorts, sort, id) in
        let disc =
          let disc_name = Prims.strcat "is-" name in
          let xfv = ("x", sort) in
          let xx = mkFreeV xfv norng in
          let disc_eq =
            let _0_276 =
              let _0_275 =
                let _0_272 =
                  let _0_271 = constr_id_of_sort sort in (_0_271, [xx]) in
                mkApp _0_272 norng in
              let _0_274 =
                let _0_273 = FStar_Util.string_of_int id in
                mkInteger _0_273 norng in
              (_0_275, _0_274) in
            mkEq _0_276 norng in
          let uu____1824 =
            let _0_281 =
              FStar_All.pipe_right fields
                (FStar_List.mapi
                   (fun i  ->
                      fun uu____1861  ->
                        match uu____1861 with
                        | (proj,s,projectible) ->
                            if projectible
                            then
                              let _0_277 = mkApp (proj, [xx]) norng in
                              (_0_277, [])
                            else
                              (let fi =
                                 let _0_279 =
                                   let _0_278 = FStar_Util.string_of_int i in
                                   Prims.strcat "f_" _0_278 in
                                 (_0_279, s) in
                               let _0_280 = mkFreeV fi norng in
                               (_0_280, [fi])))) in
            FStar_All.pipe_right _0_281 FStar_List.split in
          match uu____1824 with
          | (proj_terms,ex_vars) ->
              let ex_vars = FStar_List.flatten ex_vars in
              let disc_inv_body =
                let _0_283 =
                  let _0_282 = mkApp (name, proj_terms) norng in (xx, _0_282) in
                mkEq _0_283 norng in
              let disc_inv_body =
                match ex_vars with
                | [] -> disc_inv_body
                | uu____1921 -> mkExists ([], ex_vars, disc_inv_body) norng in
              let disc_ax = mkAnd (disc_eq, disc_inv_body) norng in
              let def =
                mkDefineFun
                  (disc_name, [xfv], Bool_sort, disc_ax,
                    (Some "Discriminator definition")) in
              def in
        let projs =
          if injective
          then injective_constructor (name, fields, sort)
          else [] in
        let _0_288 =
          let _0_284 =
            Caption (FStar_Util.format1 "<start constructor %s>" name) in
          _0_284 :: cdecl :: cid :: projs in
        let _0_287 =
          let _0_286 =
            let _0_285 =
              Caption (FStar_Util.format1 "</end constructor %s>" name) in
            [_0_285] in
          FStar_List.append [disc] _0_286 in
        FStar_List.append _0_288 _0_287
let name_binders_inner:
  Prims.string Prims.option ->
    (Prims.string* sort) Prims.list ->
      Prims.int ->
        sort Prims.list ->
          ((Prims.string* sort) Prims.list* Prims.string Prims.list*
            Prims.int)
  =
  fun prefix_opt  ->
    fun outer_names  ->
      fun start  ->
        fun sorts  ->
          let uu____1973 =
            FStar_All.pipe_right sorts
              (FStar_List.fold_left
                 (fun uu____1996  ->
                    fun s  ->
                      match uu____1996 with
                      | (names,binders,n) ->
                          let prefix =
                            match s with
                            | Term_sort  -> "@x"
                            | uu____2024 -> "@u" in
                          let prefix =
                            match prefix_opt with
                            | None  -> prefix
                            | Some p -> Prims.strcat p prefix in
                          let nm =
                            let _0_289 = FStar_Util.string_of_int n in
                            Prims.strcat prefix _0_289 in
                          let names = (nm, s) :: names in
                          let b =
                            let _0_290 = strSort s in
                            FStar_Util.format2 "(%s %s)" nm _0_290 in
                          (names, (b :: binders),
                            (n + (Prims.parse_int "1"))))
                 (outer_names, [], start)) in
          match uu____1973 with
          | (names,binders,n) -> (names, (FStar_List.rev binders), n)
let name_macro_binders:
  sort Prims.list ->
    ((Prims.string* sort) Prims.list* Prims.string Prims.list)
  =
  fun sorts  ->
    let uu____2076 =
      name_binders_inner (Some "__") [] (Prims.parse_int "0") sorts in
    match uu____2076 with
    | (names,binders,n) -> ((FStar_List.rev names), binders)
let termToSmt: term -> Prims.string =
  fun t  ->
    let remove_guard_free pats =
      FStar_All.pipe_right pats
        (FStar_List.map
           (fun ps  ->
              FStar_All.pipe_right ps
                (FStar_List.map
                   (fun tm  ->
                      match tm.tm with
                      | App
                          (Var
                           "Prims.guard_free",{ tm = BoundV uu____2133;
                                                freevars = uu____2134;
                                                rng = uu____2135;_}::[])
                          -> tm
                      | App (Var "Prims.guard_free",p::[]) -> p
                      | uu____2143 -> tm)))) in
    let rec aux' n names t =
      match t.tm with
      | Integer i -> i
      | BoundV i ->
          let _0_291 = FStar_List.nth names i in
          FStar_All.pipe_right _0_291 Prims.fst
      | FreeV x -> Prims.fst x
      | App (op,[]) -> op_to_string op
      | App (op,tms) ->
          let _0_293 =
            let _0_292 = FStar_List.map (aux n names) tms in
            FStar_All.pipe_right _0_292 (FStar_String.concat "\n") in
          FStar_Util.format2 "(%s %s)" (op_to_string op) _0_293
      | Labeled (t,uu____2177,uu____2178) -> aux n names t
      | LblPos (t,s) ->
          let _0_294 = aux n names t in
          FStar_Util.format2 "(! %s :lblpos %s)" _0_294 s
      | Quant (qop,pats,wopt,sorts,body) ->
          let uu____2194 = name_binders_inner None names n sorts in
          (match uu____2194 with
           | (names,binders,n) ->
               let binders =
                 FStar_All.pipe_right binders (FStar_String.concat " ") in
               let pats = remove_guard_free pats in
               let pats_str =
                 match pats with
                 | []::[]|[] -> ""
                 | uu____2222 ->
                     let _0_298 =
                       FStar_All.pipe_right pats
                         (FStar_List.map
                            (fun pats  ->
                               let _0_297 =
                                 let _0_296 =
                                   FStar_List.map
                                     (fun p  ->
                                        let _0_295 = aux n names p in
                                        FStar_Util.format1 "%s" _0_295) pats in
                                 FStar_String.concat " " _0_296 in
                               FStar_Util.format1 "\n:pattern (%s)" _0_297)) in
                     FStar_All.pipe_right _0_298 (FStar_String.concat "\n") in
               (match (pats, wopt) with
                | ([]::[],None )|([],None ) ->
                    let _0_299 = aux n names body in
                    FStar_Util.format3 "(%s (%s)\n %s);;no pats\n"
                      (qop_to_string qop) binders _0_299
                | uu____2245 ->
                    let _0_301 = aux n names body in
                    let _0_300 = weightToSmt wopt in
                    FStar_Util.format5 "(%s (%s)\n (! %s\n %s %s))"
                      (qop_to_string qop) binders _0_301 _0_300 pats_str))
    and aux n names t =
      let s = aux' n names t in
      if t.rng <> norng
      then
        let _0_303 = FStar_Range.string_of_range t.rng in
        let _0_302 = FStar_Range.string_of_use_range t.rng in
        FStar_Util.format3 "\n;; def=%s; use=%s\n%s\n" _0_303 _0_302 s
      else s in
    aux (Prims.parse_int "0") [] t
let caption_to_string: Prims.string Prims.option -> Prims.string =
  fun uu___87_2260  ->
    match uu___87_2260 with
    | None  -> ""
    | Some c ->
        let uu____2263 =
          match FStar_Util.splitlines c with
          | [] -> failwith "Impossible"
          | hd::[] -> (hd, "")
          | hd::uu____2272 -> (hd, "...") in
        (match uu____2263 with
         | (hd,suffix) ->
             FStar_Util.format2 ";;;;;;;;;;;;;;;;%s%s\n" hd suffix)
let rec declToSmt: Prims.string -> decl -> Prims.string =
  fun z3options  ->
    fun decl  ->
      let escape s = FStar_Util.replace_char s '\'' '_' in
      match decl with
      | DefPrelude  -> mkPrelude z3options
      | Caption c ->
          let _0_304 =
            FStar_All.pipe_right (FStar_Util.splitlines c)
              (fun uu___88_2290  ->
                 match uu___88_2290 with | [] -> "" | h::t -> h) in
          FStar_Util.format1 "\n; %s" _0_304
      | DeclFun (f,argsorts,retsort,c) ->
          let l = FStar_List.map strSort argsorts in
          let _0_306 = caption_to_string c in
          let _0_305 = strSort retsort in
          FStar_Util.format4 "%s(declare-fun %s (%s) %s)" _0_306 f
            (FStar_String.concat " " l) _0_305
      | DefineFun (f,arg_sorts,retsort,body,c) ->
          let uu____2310 = name_macro_binders arg_sorts in
          (match uu____2310 with
           | (names,binders) ->
               let body =
                 let _0_307 =
                   FStar_List.map (fun x  -> mkFreeV x norng) names in
                 inst _0_307 body in
               let _0_310 = caption_to_string c in
               let _0_309 = strSort retsort in
               let _0_308 = termToSmt body in
               FStar_Util.format5 "%s(define-fun %s (%s) %s\n %s)" _0_310 f
                 (FStar_String.concat " " binders) _0_309 _0_308)
      | Assume (t,c,Some n) ->
          let _0_312 = caption_to_string c in
          let _0_311 = termToSmt t in
          FStar_Util.format3 "%s(assert (!\n%s\n:named %s))" _0_312 _0_311
            (escape n)
      | Assume (t,c,None ) ->
          let _0_314 = caption_to_string c in
          let _0_313 = termToSmt t in
          FStar_Util.format2 "%s(assert %s)" _0_314 _0_313
      | Eval t ->
          let _0_315 = termToSmt t in FStar_Util.format1 "(eval %s)" _0_315
      | Echo s -> FStar_Util.format1 "(echo \"%s\")" s
      | CheckSat  -> "(check-sat)"
      | GetUnsatCore  ->
          "(echo \"<unsat-core>\")\n(get-unsat-core)\n(echo \"</unsat-core>\")"
      | Push  -> "(push)"
      | Pop  -> "(pop)"
      | SetOption (s,v) -> FStar_Util.format2 "(set-option :%s %s)" s v
      | PrintStats  -> "(get-info :all-statistics)"
and mkPrelude: Prims.string -> Prims.string =
  fun z3options  ->
    let basic =
      Prims.strcat z3options
        "(declare-sort Ref)\n(declare-fun Ref_constr_id (Ref) Int)\n\n(declare-sort FString)\n(declare-fun FString_constr_id (FString) Int)\n\n(declare-sort Term)\n(declare-fun Term_constr_id (Term) Int)\n(declare-datatypes () ((Fuel \n(ZFuel) \n(SFuel (prec Fuel)))))\n(declare-fun MaxIFuel () Fuel)\n(declare-fun MaxFuel () Fuel)\n(declare-fun PreType (Term) Term)\n(declare-fun Valid (Term) Bool)\n(declare-fun HasTypeFuel (Fuel Term Term) Bool)\n(define-fun HasTypeZ ((x Term) (t Term)) Bool\n(HasTypeFuel ZFuel x t))\n(define-fun HasType ((x Term) (t Term)) Bool\n(HasTypeFuel MaxIFuel x t))\n;;fuel irrelevance\n(assert (forall ((f Fuel) (x Term) (t Term))\n(! (= (HasTypeFuel (SFuel f) x t)\n(HasTypeZ x t))\n:pattern ((HasTypeFuel (SFuel f) x t)))))\n(define-fun  IsTyped ((x Term)) Bool\n(exists ((t Term)) (HasTypeZ x t)))\n(declare-fun ApplyTF (Term Fuel) Term)\n(declare-fun ApplyTT (Term Term) Term)\n(declare-fun Rank (Term) Int)\n(declare-fun Closure (Term) Term)\n(declare-fun ConsTerm (Term Term) Term)\n(declare-fun ConsFuel (Fuel Term) Term)\n(declare-fun Precedes (Term Term) Term)\n(define-fun Reify ((x Term)) Term x)\n(assert (forall ((t Term))\n(! (implies (exists ((e Term)) (HasType e t))\n(Valid t))\n:pattern ((Valid t)))))\n(assert (forall ((t1 Term) (t2 Term))\n(! (iff (Valid (Precedes t1 t2)) \n(< (Rank t1) (Rank t2)))\n:pattern ((Precedes t1 t2)))))\n(define-fun Prims.precedes ((a Term) (b Term) (t1 Term) (t2 Term)) Term\n(Precedes t1 t2))\n(declare-fun Range_const () Term)\n" in
    let constrs =
      [("FString_const", [("FString_const_proj_0", Int_sort, true)],
         String_sort, (Prims.parse_int "0"), true);
      ("Tm_type", [], Term_sort, (Prims.parse_int "2"), true);
      ("Tm_arrow", [("Tm_arrow_id", Int_sort, true)], Term_sort,
        (Prims.parse_int "3"), false);
      ("Tm_uvar", [("Tm_uvar_fst", Int_sort, true)], Term_sort,
        (Prims.parse_int "5"), true);
      ("Tm_unit", [], Term_sort, (Prims.parse_int "6"), true);
      ("BoxInt", [("BoxInt_proj_0", Int_sort, true)], Term_sort,
        (Prims.parse_int "7"), true);
      ("BoxBool", [("BoxBool_proj_0", Bool_sort, true)], Term_sort,
        (Prims.parse_int "8"), true);
      ("BoxString", [("BoxString_proj_0", String_sort, true)], Term_sort,
        (Prims.parse_int "9"), true);
      ("BoxRef", [("BoxRef_proj_0", Ref_sort, true)], Term_sort,
        (Prims.parse_int "10"), true);
      ("LexCons",
        [("LexCons_0", Term_sort, true); ("LexCons_1", Term_sort, true)],
        Term_sort, (Prims.parse_int "11"), true)] in
    let bcons =
      let _0_317 =
        let _0_316 =
          FStar_All.pipe_right constrs
            (FStar_List.collect constructor_to_decl) in
        FStar_All.pipe_right _0_316 (FStar_List.map (declToSmt z3options)) in
      FStar_All.pipe_right _0_317 (FStar_String.concat "\n") in
    let lex_ordering =
      "\n(define-fun is-Prims.LexCons ((t Term)) Bool \n(is-LexCons t))\n(assert (forall ((x1 Term) (x2 Term) (y1 Term) (y2 Term))\n(iff (Valid (Precedes (LexCons x1 x2) (LexCons y1 y2)))\n(or (Valid (Precedes x1 y1))\n(and (= x1 y1)\n(Valid (Precedes x2 y2)))))))\n" in
    Prims.strcat basic (Prims.strcat bcons lex_ordering)
let mk_Range_const: term = mkApp ("Range_const", []) norng
let mk_Term_type: term = mkApp ("Tm_type", []) norng
let mk_Term_app: term -> term -> FStar_Range.range -> term =
  fun t1  -> fun t2  -> fun r  -> mkApp ("Tm_app", [t1; t2]) r
let mk_Term_uvar: Prims.int -> FStar_Range.range -> term =
  fun i  ->
    fun r  ->
      let _0_320 =
        let _0_319 = let _0_318 = mkInteger' i norng in [_0_318] in
        ("Tm_uvar", _0_319) in
      mkApp _0_320 r
let mk_Term_unit: term = mkApp ("Tm_unit", []) norng
let boxInt: term -> term = fun t  -> mkApp ("BoxInt", [t]) t.rng
let unboxInt: term -> term = fun t  -> mkApp ("BoxInt_proj_0", [t]) t.rng
let boxBool: term -> term = fun t  -> mkApp ("BoxBool", [t]) t.rng
let unboxBool: term -> term = fun t  -> mkApp ("BoxBool_proj_0", [t]) t.rng
let boxString: term -> term = fun t  -> mkApp ("BoxString", [t]) t.rng
let unboxString: term -> term =
  fun t  -> mkApp ("BoxString_proj_0", [t]) t.rng
let boxRef: term -> term = fun t  -> mkApp ("BoxRef", [t]) t.rng
let unboxRef: term -> term = fun t  -> mkApp ("BoxRef_proj_0", [t]) t.rng
let boxTerm: sort -> term -> term =
  fun sort  ->
    fun t  ->
      match sort with
      | Int_sort  -> boxInt t
      | Bool_sort  -> boxBool t
      | String_sort  -> boxString t
      | Ref_sort  -> boxRef t
      | uu____2607 -> Prims.raise FStar_Util.Impos
let unboxTerm: sort -> term -> term =
  fun sort  ->
    fun t  ->
      match sort with
      | Int_sort  -> unboxInt t
      | Bool_sort  -> unboxBool t
      | String_sort  -> unboxString t
      | Ref_sort  -> unboxRef t
      | uu____2614 -> Prims.raise FStar_Util.Impos
let mk_PreType: term -> term = fun t  -> mkApp ("PreType", [t]) t.rng
let mk_Valid: term -> term =
  fun t  ->
    match t.tm with
    | App
        (Var
         "Prims.b2t",{
                       tm = App
                         (Var "Prims.op_Equality",uu____2622::t1::t2::[]);
                       freevars = uu____2625; rng = uu____2626;_}::[])
        -> mkEq (t1, t2) t.rng
    | App
        (Var
         "Prims.b2t",{
                       tm = App
                         (Var "Prims.op_disEquality",uu____2633::t1::t2::[]);
                       freevars = uu____2636; rng = uu____2637;_}::[])
        -> let _0_321 = mkEq (t1, t2) norng in mkNot _0_321 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_LessThanOrEqual",t1::t2::[]);
                       freevars = uu____2646; rng = uu____2647;_}::[])
        ->
        let _0_324 =
          let _0_323 = unboxInt t1 in
          let _0_322 = unboxInt t2 in (_0_323, _0_322) in
        mkLTE _0_324 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_LessThan",t1::t2::[]);
                       freevars = uu____2656; rng = uu____2657;_}::[])
        ->
        let _0_327 =
          let _0_326 = unboxInt t1 in
          let _0_325 = unboxInt t2 in (_0_326, _0_325) in
        mkLT _0_327 t.rng
    | App
        (Var
         "Prims.b2t",{
                       tm = App
                         (Var "Prims.op_GreaterThanOrEqual",t1::t2::[]);
                       freevars = uu____2666; rng = uu____2667;_}::[])
        ->
        let _0_330 =
          let _0_329 = unboxInt t1 in
          let _0_328 = unboxInt t2 in (_0_329, _0_328) in
        mkGTE _0_330 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_GreaterThan",t1::t2::[]);
                       freevars = uu____2676; rng = uu____2677;_}::[])
        ->
        let _0_333 =
          let _0_332 = unboxInt t1 in
          let _0_331 = unboxInt t2 in (_0_332, _0_331) in
        mkGT _0_333 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_AmpAmp",t1::t2::[]);
                       freevars = uu____2686; rng = uu____2687;_}::[])
        ->
        let _0_336 =
          let _0_335 = unboxBool t1 in
          let _0_334 = unboxBool t2 in (_0_335, _0_334) in
        mkAnd _0_336 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_BarBar",t1::t2::[]);
                       freevars = uu____2696; rng = uu____2697;_}::[])
        ->
        let _0_339 =
          let _0_338 = unboxBool t1 in
          let _0_337 = unboxBool t2 in (_0_338, _0_337) in
        mkOr _0_339 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_Negation",t::[]);
                       freevars = uu____2705; rng = uu____2706;_}::[])
        -> let _0_340 = unboxBool t in mkNot _0_340 t.rng
    | App (Var "Prims.b2t",t1::[]) ->
        let uu___89_2715 = unboxBool t1 in
        {
          tm = (uu___89_2715.tm);
          freevars = (uu___89_2715.freevars);
          rng = (t.rng)
        }
    | uu____2718 -> mkApp ("Valid", [t]) t.rng
let mk_HasType: term -> term -> term =
  fun v  -> fun t  -> mkApp ("HasType", [v; t]) t.rng
let mk_HasTypeZ: term -> term -> term =
  fun v  -> fun t  -> mkApp ("HasTypeZ", [v; t]) t.rng
let mk_IsTyped: term -> term = fun v  -> mkApp ("IsTyped", [v]) norng
let mk_HasTypeFuel: term -> term -> term -> term =
  fun f  ->
    fun v  ->
      fun t  ->
        let uu____2747 = FStar_Options.unthrottle_inductives () in
        if uu____2747
        then mk_HasType v t
        else mkApp ("HasTypeFuel", [f; v; t]) t.rng
let mk_HasTypeWithFuel: term Prims.option -> term -> term -> term =
  fun f  ->
    fun v  ->
      fun t  ->
        match f with
        | None  -> mk_HasType v t
        | Some f -> mk_HasTypeFuel f v t
let mk_Destruct: term -> FStar_Range.range -> term =
  fun v  -> mkApp ("Destruct", [v])
let mk_Rank: term -> FStar_Range.range -> term =
  fun x  -> mkApp ("Rank", [x])
let mk_tester: Prims.string -> term -> term =
  fun n  -> fun t  -> mkApp ((Prims.strcat "is-" n), [t]) t.rng
let mk_ApplyTF: term -> term -> term =
  fun t  -> fun t'  -> mkApp ("ApplyTF", [t; t']) t.rng
let mk_ApplyTT: term -> term -> FStar_Range.range -> term =
  fun t  -> fun t'  -> fun r  -> mkApp ("ApplyTT", [t; t']) r
let mk_String_const: Prims.int -> FStar_Range.range -> term =
  fun i  ->
    fun r  ->
      let _0_343 =
        let _0_342 = let _0_341 = mkInteger' i norng in [_0_341] in
        ("FString_const", _0_342) in
      mkApp _0_343 r
let mk_Precedes: term -> term -> FStar_Range.range -> term =
  fun x1  ->
    fun x2  ->
      fun r  ->
        let _0_344 = mkApp ("Precedes", [x1; x2]) r in
        FStar_All.pipe_right _0_344 mk_Valid
let mk_LexCons: term -> term -> FStar_Range.range -> term =
  fun x1  -> fun x2  -> fun r  -> mkApp ("LexCons", [x1; x2]) r
let rec n_fuel: Prims.int -> term =
  fun n  ->
    if n = (Prims.parse_int "0")
    then mkApp ("ZFuel", []) norng
    else
      (let _0_347 =
         let _0_346 =
           let _0_345 = n_fuel (n - (Prims.parse_int "1")) in [_0_345] in
         ("SFuel", _0_346) in
       mkApp _0_347 norng)
let fuel_2: term = n_fuel (Prims.parse_int "2")
let fuel_100: term = n_fuel (Prims.parse_int "100")
let mk_and_opt:
  term Prims.option ->
    term Prims.option -> FStar_Range.range -> term Prims.option
  =
  fun p1  ->
    fun p2  ->
      fun r  ->
        match (p1, p2) with
        | (Some p1,Some p2) -> Some (mkAnd (p1, p2) r)
        | (Some p,None )|(None ,Some p) -> Some p
        | (None ,None ) -> None
let mk_and_opt_l:
  term Prims.option Prims.list -> FStar_Range.range -> term Prims.option =
  fun pl  ->
    fun r  ->
      FStar_List.fold_right (fun p  -> fun out  -> mk_and_opt p out r) pl
        None
let mk_and_l: term Prims.list -> FStar_Range.range -> term =
  fun l  ->
    fun r  ->
      let _0_348 = mkTrue r in
      FStar_List.fold_right (fun p1  -> fun p2  -> mkAnd (p1, p2) r) l _0_348
let mk_or_l: term Prims.list -> FStar_Range.range -> term =
  fun l  ->
    fun r  ->
      let _0_349 = mkFalse r in
      FStar_List.fold_right (fun p1  -> fun p2  -> mkOr (p1, p2) r) l _0_349
let mk_haseq: term -> term =
  fun t  -> mk_Valid (mkApp ("Prims.hasEq", [t]) t.rng)
let rec print_smt_term: term -> Prims.string =
  fun t  ->
    match t.tm with
    | Integer n -> FStar_Util.format1 "(Integer %s)" n
    | BoundV n ->
        let _0_350 = FStar_Util.string_of_int n in
        FStar_Util.format1 "(BoundV %s)" _0_350
    | FreeV fv -> FStar_Util.format1 "(FreeV %s)" (Prims.fst fv)
    | App (op,l) ->
        let _0_351 = print_smt_term_list l in
        FStar_Util.format2 "(%s %s)" (op_to_string op) _0_351
    | Labeled (t,r1,r2) ->
        let _0_352 = print_smt_term t in
        FStar_Util.format2 "(Labeled '%s' %s)" r1 _0_352
    | LblPos (t,s) ->
        let _0_353 = print_smt_term t in
        FStar_Util.format2 "(LblPos %s %s)" s _0_353
    | Quant (qop,l,uu____2926,uu____2927,t) ->
        let _0_355 = print_smt_term_list_list l in
        let _0_354 = print_smt_term t in
        FStar_Util.format3 "(%s %s %s)" (qop_to_string qop) _0_355 _0_354
and print_smt_term_list: term Prims.list -> Prims.string =
  fun l  ->
    let _0_356 = FStar_List.map print_smt_term l in
    FStar_All.pipe_right _0_356 (FStar_String.concat " ")
and print_smt_term_list_list: term Prims.list Prims.list -> Prims.string =
  fun l  ->
    FStar_List.fold_left
      (fun s  ->
         fun l  ->
           let _0_359 =
             let _0_358 =
               let _0_357 = print_smt_term_list l in
               Prims.strcat _0_357 " ] " in
             Prims.strcat "; [ " _0_358 in
           Prims.strcat s _0_359) "" l