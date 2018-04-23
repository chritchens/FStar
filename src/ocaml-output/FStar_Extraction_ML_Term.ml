
open Prims
open FStar_Pervasives
exception Un_extractable


let uu___is_Un_extractable : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Un_extractable -> begin
true
end
| uu____6 -> begin
false
end))


let type_leq : FStar_Extraction_ML_UEnv.env  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlty  ->  Prims.bool = (fun g t1 t2 -> (FStar_Extraction_ML_Util.type_leq (FStar_Extraction_ML_Util.udelta_unfold g) t1 t2))


let type_leq_c : FStar_Extraction_ML_UEnv.env  ->  FStar_Extraction_ML_Syntax.mlexpr FStar_Pervasives_Native.option  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlty  ->  (Prims.bool * FStar_Extraction_ML_Syntax.mlexpr FStar_Pervasives_Native.option) = (fun g t1 t2 -> (FStar_Extraction_ML_Util.type_leq_c (FStar_Extraction_ML_Util.udelta_unfold g) t1 t2))


let eraseTypeDeep : FStar_Extraction_ML_UEnv.env  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlty = (fun g t -> (FStar_Extraction_ML_Util.eraseTypeDeep (FStar_Extraction_ML_Util.udelta_unfold g) t))


let record_fields : 'Auu____68 . FStar_Ident.ident Prims.list  ->  'Auu____68 Prims.list  ->  (Prims.string * 'Auu____68) Prims.list = (fun fs vs -> (FStar_List.map2 (fun f e -> ((f.FStar_Ident.idText), (e))) fs vs))


let fail : 'Auu____107 . FStar_Range.range  ->  (FStar_Errors.raw_error * Prims.string)  ->  'Auu____107 = (fun r err -> (FStar_Errors.raise_error err r))


let err_uninst : 'Auu____136 . FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  (Prims.string Prims.list * FStar_Extraction_ML_Syntax.mlty)  ->  FStar_Syntax_Syntax.term  ->  'Auu____136 = (fun env t uu____161 app -> (match (uu____161) with
| (vars, ty) -> begin
(

let uu____175 = (

let uu____180 = (

let uu____181 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____182 = (FStar_All.pipe_right vars (FStar_String.concat ", "))
in (

let uu____185 = (FStar_Extraction_ML_Code.string_of_mlty env.FStar_Extraction_ML_UEnv.currentModule ty)
in (

let uu____186 = (FStar_Syntax_Print.term_to_string app)
in (FStar_Util.format4 "Variable %s has a polymorphic type (forall %s. %s); expected it to be fully instantiated, but got %s" uu____181 uu____182 uu____185 uu____186)))))
in ((FStar_Errors.Fatal_Uninstantiated), (uu____180)))
in (fail t.FStar_Syntax_Syntax.pos uu____175))
end))


let err_ill_typed_application : 'Auu____199 'Auu____200 . FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * 'Auu____199) Prims.list  ->  FStar_Extraction_ML_Syntax.mlty  ->  'Auu____200 = (fun env t args ty -> (

let uu____233 = (

let uu____238 = (

let uu____239 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____240 = (

let uu____241 = (FStar_All.pipe_right args (FStar_List.map (fun uu____259 -> (match (uu____259) with
| (x, uu____265) -> begin
(FStar_Syntax_Print.term_to_string x)
end))))
in (FStar_All.pipe_right uu____241 (FStar_String.concat " ")))
in (

let uu____268 = (FStar_Extraction_ML_Code.string_of_mlty env.FStar_Extraction_ML_UEnv.currentModule ty)
in (FStar_Util.format3 "Ill-typed application: application is %s \n remaining args are %s\nml type of head is %s\n" uu____239 uu____240 uu____268))))
in ((FStar_Errors.Fatal_IllTyped), (uu____238)))
in (fail t.FStar_Syntax_Syntax.pos uu____233)))


let err_ill_typed_erasure : 'Auu____277 . FStar_Extraction_ML_UEnv.env  ->  FStar_Range.range  ->  FStar_Extraction_ML_Syntax.mlty  ->  'Auu____277 = (fun env pos ty -> (

let uu____293 = (

let uu____298 = (

let uu____299 = (FStar_Extraction_ML_Code.string_of_mlty env.FStar_Extraction_ML_UEnv.currentModule ty)
in (FStar_Util.format1 "Erased value found where a value of type %s was expected" uu____299))
in ((FStar_Errors.Fatal_IllTyped), (uu____298)))
in (fail pos uu____293)))


let err_value_restriction : 'Auu____304 . FStar_Syntax_Syntax.term  ->  'Auu____304 = (fun t -> (

let uu____310 = (

let uu____315 = (

let uu____316 = (FStar_Syntax_Print.tag_of_term t)
in (

let uu____317 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format2 "Refusing to generalize because of the value restriction: (%s) %s" uu____316 uu____317)))
in ((FStar_Errors.Fatal_ValueRestriction), (uu____315)))
in (fail t.FStar_Syntax_Syntax.pos uu____310)))


let err_unexpected_eff : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.e_tag  ->  FStar_Extraction_ML_Syntax.e_tag  ->  unit = (fun env t ty f0 f1 -> (

let uu____347 = (

let uu____352 = (

let uu____353 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____354 = (FStar_Extraction_ML_Code.string_of_mlty env.FStar_Extraction_ML_UEnv.currentModule ty)
in (

let uu____355 = (FStar_Extraction_ML_Util.eff_to_string f0)
in (

let uu____356 = (FStar_Extraction_ML_Util.eff_to_string f1)
in (FStar_Util.format4 "for expression %s of type %s, Expected effect %s; got effect %s" uu____353 uu____354 uu____355 uu____356)))))
in ((FStar_Errors.Warning_ExtractionUnexpectedEffect), (uu____352)))
in (FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos uu____347)))


let effect_as_etag : FStar_Extraction_ML_UEnv.env  ->  FStar_Ident.lident  ->  FStar_Extraction_ML_Syntax.e_tag = (

let cache = (FStar_Util.smap_create (Prims.parse_int "20"))
in (

let rec delta_norm_eff = (fun g l -> (

let uu____379 = (FStar_Util.smap_try_find cache l.FStar_Ident.str)
in (match (uu____379) with
| FStar_Pervasives_Native.Some (l1) -> begin
l1
end
| FStar_Pervasives_Native.None -> begin
(

let res = (

let uu____384 = (FStar_TypeChecker_Env.lookup_effect_abbrev g.FStar_Extraction_ML_UEnv.tcenv ((FStar_Syntax_Syntax.U_zero)::[]) l)
in (match (uu____384) with
| FStar_Pervasives_Native.None -> begin
l
end
| FStar_Pervasives_Native.Some (uu____395, c) -> begin
(delta_norm_eff g (FStar_Syntax_Util.comp_effect_name c))
end))
in ((FStar_Util.smap_add cache l.FStar_Ident.str res);
res;
))
end)))
in (fun g l -> (

let l1 = (delta_norm_eff g l)
in (

let uu____405 = (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid)
in (match (uu____405) with
| true -> begin
FStar_Extraction_ML_Syntax.E_PURE
end
| uu____406 -> begin
(

let uu____407 = (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid)
in (match (uu____407) with
| true -> begin
FStar_Extraction_ML_Syntax.E_GHOST
end
| uu____408 -> begin
(

let ed_opt = (FStar_TypeChecker_Env.effect_decl_opt g.FStar_Extraction_ML_UEnv.tcenv l1)
in (match (ed_opt) with
| FStar_Pervasives_Native.Some (ed, qualifiers) -> begin
(

let uu____430 = (FStar_All.pipe_right qualifiers (FStar_List.contains FStar_Syntax_Syntax.Reifiable))
in (match (uu____430) with
| true -> begin
FStar_Extraction_ML_Syntax.E_PURE
end
| uu____433 -> begin
FStar_Extraction_ML_Syntax.E_IMPURE
end))
end
| FStar_Pervasives_Native.None -> begin
FStar_Extraction_ML_Syntax.E_IMPURE
end))
end))
end))))))


let rec is_arity : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun env t -> (

let t1 = (FStar_Syntax_Util.unmeta t)
in (

let uu____451 = (

let uu____452 = (FStar_Syntax_Subst.compress t1)
in uu____452.FStar_Syntax_Syntax.n)
in (match (uu____451) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_delayed (uu____455) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_ascribed (uu____480) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_meta (uu____507) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____515 = (FStar_Syntax_Util.unfold_lazy i)
in (is_arity env uu____515))
end
| FStar_Syntax_Syntax.Tm_uvar (uu____516) -> begin
false
end
| FStar_Syntax_Syntax.Tm_constant (uu____517) -> begin
false
end
| FStar_Syntax_Syntax.Tm_name (uu____518) -> begin
false
end
| FStar_Syntax_Syntax.Tm_quoted (uu____519) -> begin
false
end
| FStar_Syntax_Syntax.Tm_bvar (uu____526) -> begin
false
end
| FStar_Syntax_Syntax.Tm_type (uu____527) -> begin
true
end
| FStar_Syntax_Syntax.Tm_arrow (uu____528, c) -> begin
(is_arity env (FStar_Syntax_Util.comp_result c))
end
| FStar_Syntax_Syntax.Tm_fvar (uu____546) -> begin
(

let t2 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.AllowUnboundUniverses)::(FStar_TypeChecker_Normalize.EraseUniverses)::(FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::[]) env.FStar_Extraction_ML_UEnv.tcenv t1)
in (

let uu____548 = (

let uu____549 = (FStar_Syntax_Subst.compress t2)
in uu____549.FStar_Syntax_Syntax.n)
in (match (uu____548) with
| FStar_Syntax_Syntax.Tm_fvar (uu____552) -> begin
false
end
| uu____553 -> begin
(is_arity env t2)
end)))
end
| FStar_Syntax_Syntax.Tm_app (uu____554) -> begin
(

let uu____569 = (FStar_Syntax_Util.head_and_args t1)
in (match (uu____569) with
| (head1, uu____585) -> begin
(is_arity env head1)
end))
end
| FStar_Syntax_Syntax.Tm_uinst (head1, uu____607) -> begin
(is_arity env head1)
end
| FStar_Syntax_Syntax.Tm_refine (x, uu____613) -> begin
(is_arity env x.FStar_Syntax_Syntax.sort)
end
| FStar_Syntax_Syntax.Tm_abs (uu____618, body, uu____620) -> begin
(is_arity env body)
end
| FStar_Syntax_Syntax.Tm_let (uu____641, body) -> begin
(is_arity env body)
end
| FStar_Syntax_Syntax.Tm_match (uu____659, branches) -> begin
(match (branches) with
| ((uu____697, uu____698, e))::uu____700 -> begin
(is_arity env e)
end
| uu____747 -> begin
false
end)
end))))


let rec is_type_aux : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun env t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____775) -> begin
(

let uu____800 = (

let uu____801 = (FStar_Syntax_Print.tag_of_term t1)
in (FStar_Util.format1 "Impossible: %s" uu____801))
in (failwith uu____800))
end
| FStar_Syntax_Syntax.Tm_unknown -> begin
(

let uu____802 = (

let uu____803 = (FStar_Syntax_Print.tag_of_term t1)
in (FStar_Util.format1 "Impossible: %s" uu____803))
in (failwith uu____802))
end
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____805 = (FStar_Syntax_Util.unfold_lazy i)
in (is_type_aux env uu____805))
end
| FStar_Syntax_Syntax.Tm_constant (uu____806) -> begin
false
end
| FStar_Syntax_Syntax.Tm_type (uu____807) -> begin
true
end
| FStar_Syntax_Syntax.Tm_refine (uu____808) -> begin
true
end
| FStar_Syntax_Syntax.Tm_arrow (uu____815) -> begin
true
end
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.failwith_lid) -> begin
false
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Extraction_ML_UEnv.is_type_name env fv)
end
| FStar_Syntax_Syntax.Tm_uvar ({FStar_Syntax_Syntax.ctx_uvar_head = uu____830; FStar_Syntax_Syntax.ctx_uvar_gamma = uu____831; FStar_Syntax_Syntax.ctx_uvar_binders = uu____832; FStar_Syntax_Syntax.ctx_uvar_typ = t2; FStar_Syntax_Syntax.ctx_uvar_reason = uu____834; FStar_Syntax_Syntax.ctx_uvar_should_check = uu____835; FStar_Syntax_Syntax.ctx_uvar_range = uu____836}) -> begin
(is_arity env t2)
end
| FStar_Syntax_Syntax.Tm_bvar ({FStar_Syntax_Syntax.ppname = uu____857; FStar_Syntax_Syntax.index = uu____858; FStar_Syntax_Syntax.sort = t2}) -> begin
(is_arity env t2)
end
| FStar_Syntax_Syntax.Tm_name ({FStar_Syntax_Syntax.ppname = uu____862; FStar_Syntax_Syntax.index = uu____863; FStar_Syntax_Syntax.sort = t2}) -> begin
(is_arity env t2)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____868, uu____869) -> begin
(is_type_aux env t2)
end
| FStar_Syntax_Syntax.Tm_uinst (t2, uu____911) -> begin
(is_type_aux env t2)
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, uu____918) -> begin
(

let uu____939 = (FStar_Syntax_Subst.open_term bs body)
in (match (uu____939) with
| (uu____944, body1) -> begin
(is_type_aux env body1)
end))
end
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) -> begin
(

let x = (FStar_Util.left lb.FStar_Syntax_Syntax.lbname)
in (

let uu____961 = (

let uu____966 = (

let uu____967 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____967)::[])
in (FStar_Syntax_Subst.open_term uu____966 body))
in (match (uu____961) with
| (uu____980, body1) -> begin
(is_type_aux env body1)
end)))
end
| FStar_Syntax_Syntax.Tm_let ((uu____982, lbs), body) -> begin
(

let uu____999 = (FStar_Syntax_Subst.open_let_rec lbs body)
in (match (uu____999) with
| (uu____1006, body1) -> begin
(is_type_aux env body1)
end))
end
| FStar_Syntax_Syntax.Tm_match (uu____1012, branches) -> begin
(match (branches) with
| (b)::uu____1051 -> begin
(

let uu____1096 = (FStar_Syntax_Subst.open_branch b)
in (match (uu____1096) with
| (uu____1097, uu____1098, e) -> begin
(is_type_aux env e)
end))
end
| uu____1116 -> begin
false
end)
end
| FStar_Syntax_Syntax.Tm_quoted (uu____1133) -> begin
false
end
| FStar_Syntax_Syntax.Tm_meta (t2, uu____1141) -> begin
(is_type_aux env t2)
end
| FStar_Syntax_Syntax.Tm_app (head1, uu____1147) -> begin
(is_type_aux env head1)
end)))


let is_type : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun env t -> ((FStar_Extraction_ML_UEnv.debug env (fun uu____1182 -> (

let uu____1183 = (FStar_Syntax_Print.tag_of_term t)
in (

let uu____1184 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "checking is_type (%s) %s\n" uu____1183 uu____1184)))));
(

let b = (is_type_aux env t)
in ((FStar_Extraction_ML_UEnv.debug env (fun uu____1190 -> (match (b) with
| true -> begin
(

let uu____1191 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____1192 = (FStar_Syntax_Print.tag_of_term t)
in (FStar_Util.print2 "is_type %s (%s)\n" uu____1191 uu____1192)))
end
| uu____1193 -> begin
(

let uu____1194 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____1195 = (FStar_Syntax_Print.tag_of_term t)
in (FStar_Util.print2 "not a type %s (%s)\n" uu____1194 uu____1195)))
end)));
b;
));
))


let is_type_binder : 'Auu____1202 . FStar_Extraction_ML_UEnv.env  ->  (FStar_Syntax_Syntax.bv * 'Auu____1202)  ->  Prims.bool = (fun env x -> (is_arity env (FStar_Pervasives_Native.fst x).FStar_Syntax_Syntax.sort))


let is_constructor : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____1226 = (

let uu____1227 = (FStar_Syntax_Subst.compress t)
in uu____1227.FStar_Syntax_Syntax.n)
in (match (uu____1226) with
| FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = uu____1230; FStar_Syntax_Syntax.fv_delta = uu____1231; FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)}) -> begin
true
end
| FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = uu____1232; FStar_Syntax_Syntax.fv_delta = uu____1233; FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (uu____1234))}) -> begin
true
end
| uu____1241 -> begin
false
end)))


let rec is_fstar_value : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____1247 = (

let uu____1248 = (FStar_Syntax_Subst.compress t)
in uu____1248.FStar_Syntax_Syntax.n)
in (match (uu____1247) with
| FStar_Syntax_Syntax.Tm_constant (uu____1251) -> begin
true
end
| FStar_Syntax_Syntax.Tm_bvar (uu____1252) -> begin
true
end
| FStar_Syntax_Syntax.Tm_fvar (uu____1253) -> begin
true
end
| FStar_Syntax_Syntax.Tm_abs (uu____1254) -> begin
true
end
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let uu____1293 = (is_constructor head1)
in (match (uu____1293) with
| true -> begin
(FStar_All.pipe_right args (FStar_List.for_all (fun uu____1307 -> (match (uu____1307) with
| (te, uu____1313) -> begin
(is_fstar_value te)
end))))
end
| uu____1314 -> begin
false
end))
end
| FStar_Syntax_Syntax.Tm_meta (t1, uu____1316) -> begin
(is_fstar_value t1)
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, uu____1322, uu____1323) -> begin
(is_fstar_value t1)
end
| uu____1364 -> begin
false
end)))


let rec is_ml_value : FStar_Extraction_ML_Syntax.mlexpr  ->  Prims.bool = (fun e -> (match (e.FStar_Extraction_ML_Syntax.expr) with
| FStar_Extraction_ML_Syntax.MLE_Const (uu____1370) -> begin
true
end
| FStar_Extraction_ML_Syntax.MLE_Var (uu____1371) -> begin
true
end
| FStar_Extraction_ML_Syntax.MLE_Name (uu____1372) -> begin
true
end
| FStar_Extraction_ML_Syntax.MLE_Fun (uu____1373) -> begin
true
end
| FStar_Extraction_ML_Syntax.MLE_CTor (uu____1384, exps) -> begin
(FStar_Util.for_all is_ml_value exps)
end
| FStar_Extraction_ML_Syntax.MLE_Tuple (exps) -> begin
(FStar_Util.for_all is_ml_value exps)
end
| FStar_Extraction_ML_Syntax.MLE_Record (uu____1393, fields) -> begin
(FStar_Util.for_all (fun uu____1418 -> (match (uu____1418) with
| (uu____1423, e1) -> begin
(is_ml_value e1)
end)) fields)
end
| FStar_Extraction_ML_Syntax.MLE_TApp (h, uu____1426) -> begin
(is_ml_value h)
end
| uu____1431 -> begin
false
end))


let fresh : Prims.string  ->  Prims.string = (

let c = (FStar_Util.mk_ref (Prims.parse_int "0"))
in (fun x -> ((FStar_Util.incr c);
(

let uu____1474 = (

let uu____1475 = (FStar_ST.op_Bang c)
in (FStar_Util.string_of_int uu____1475))
in (Prims.strcat x uu____1474));
)))


let normalize_abs : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t0 -> (

let rec aux = (fun bs t copt -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_abs (bs', body, copt1) -> begin
(aux (FStar_List.append bs bs') body copt1)
end
| uu____1590 -> begin
(

let e' = (FStar_Syntax_Util.unascribe t1)
in (

let uu____1592 = (FStar_Syntax_Util.is_fun e')
in (match (uu____1592) with
| true -> begin
(aux bs e' copt)
end
| uu____1595 -> begin
(FStar_Syntax_Util.abs bs e' copt)
end)))
end)))
in (aux [] t0 FStar_Pervasives_Native.None)))


let unit_binder : FStar_Syntax_Syntax.binder = (

let uu____1600 = (FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None FStar_Syntax_Syntax.t_unit)
in (FStar_All.pipe_left FStar_Syntax_Syntax.mk_binder uu____1600))


let check_pats_for_ite : (FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term) Prims.list  ->  (Prims.bool * FStar_Syntax_Syntax.term FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term FStar_Pervasives_Native.option) = (fun l -> (

let def = ((false), (FStar_Pervasives_Native.None), (FStar_Pervasives_Native.None))
in (match ((Prims.op_disEquality (FStar_List.length l) (Prims.parse_int "2"))) with
| true -> begin
def
end
| uu____1679 -> begin
(

let uu____1680 = (FStar_List.hd l)
in (match (uu____1680) with
| (p1, w1, e1) -> begin
(

let uu____1714 = (

let uu____1723 = (FStar_List.tl l)
in (FStar_List.hd uu____1723))
in (match (uu____1714) with
| (p2, w2, e2) -> begin
(match (((w1), (w2), (p1.FStar_Syntax_Syntax.v), (p2.FStar_Syntax_Syntax.v))) with
| (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None, FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (true)), FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (false))) -> begin
((true), (FStar_Pervasives_Native.Some (e1)), (FStar_Pervasives_Native.Some (e2)))
end
| (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None, FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (false)), FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (true))) -> begin
((true), (FStar_Pervasives_Native.Some (e2)), (FStar_Pervasives_Native.Some (e1)))
end
| uu____1797 -> begin
def
end)
end))
end))
end)))


let instantiate : FStar_Extraction_ML_Syntax.mltyscheme  ->  FStar_Extraction_ML_Syntax.mlty Prims.list  ->  FStar_Extraction_ML_Syntax.mlty = (fun s args -> (FStar_Extraction_ML_Util.subst s args))


let eta_expand : FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.mlexpr = (fun t e -> (

let uu____1834 = (FStar_Extraction_ML_Util.doms_and_cod t)
in (match (uu____1834) with
| (ts, r) -> begin
(match ((Prims.op_Equality ts [])) with
| true -> begin
e
end
| uu____1849 -> begin
(

let vs = (FStar_List.map (fun uu____1854 -> (fresh "a")) ts)
in (

let vs_ts = (FStar_List.zip vs ts)
in (

let vs_es = (

let uu____1865 = (FStar_List.zip vs ts)
in (FStar_List.map (fun uu____1879 -> (match (uu____1879) with
| (v1, t1) -> begin
(FStar_Extraction_ML_Syntax.with_ty t1 (FStar_Extraction_ML_Syntax.MLE_Var (v1)))
end)) uu____1865))
in (

let body = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty r) (FStar_Extraction_ML_Syntax.MLE_App (((e), (vs_es)))))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t) (FStar_Extraction_ML_Syntax.MLE_Fun (((vs_ts), (body)))))))))
end)
end)))


let default_value_for_ty : FStar_Extraction_ML_UEnv.env  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlexpr = (fun g t -> (

let uu____1905 = (FStar_Extraction_ML_Util.doms_and_cod t)
in (match (uu____1905) with
| (ts, r) -> begin
(

let body = (fun r1 -> (

let r2 = (

let uu____1925 = (FStar_Extraction_ML_Util.udelta_unfold g r1)
in (match (uu____1925) with
| FStar_Pervasives_Native.None -> begin
r1
end
| FStar_Pervasives_Native.Some (r2) -> begin
r2
end))
in (match (r2) with
| FStar_Extraction_ML_Syntax.MLTY_Erased -> begin
FStar_Extraction_ML_Syntax.ml_unit
end
| FStar_Extraction_ML_Syntax.MLTY_Top -> begin
(FStar_Extraction_ML_Syntax.apply_obj_repr FStar_Extraction_ML_Syntax.ml_unit FStar_Extraction_ML_Syntax.MLTY_Erased)
end
| uu____1929 -> begin
(FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty r2) (FStar_Extraction_ML_Syntax.MLE_Coerce (((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.MLTY_Erased), (r2)))))
end)))
in (match ((Prims.op_Equality ts [])) with
| true -> begin
(body r)
end
| uu____1932 -> begin
(

let vs = (FStar_List.map (fun uu____1937 -> (fresh "a")) ts)
in (

let vs_ts = (FStar_List.zip vs ts)
in (

let uu____1945 = (

let uu____1946 = (

let uu____1957 = (body r)
in ((vs_ts), (uu____1957)))
in FStar_Extraction_ML_Syntax.MLE_Fun (uu____1946))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t) uu____1945))))
end))
end)))


let maybe_eta_expand : FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.mlexpr = (fun expect e -> (

let uu____1974 = ((FStar_Options.ml_no_eta_expand_coertions ()) || (

let uu____1976 = (FStar_Options.codegen ())
in (Prims.op_Equality uu____1976 (FStar_Pervasives_Native.Some (FStar_Options.Kremlin)))))
in (match (uu____1974) with
| true -> begin
e
end
| uu____1981 -> begin
(eta_expand expect e)
end)))


let maybe_coerce : 'Auu____1994 . 'Auu____1994  ->  FStar_Extraction_ML_UEnv.env  ->  FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlexpr = (fun pos g e ty expect -> (

let ty1 = (eraseTypeDeep g ty)
in (

let uu____2021 = (type_leq_c g (FStar_Pervasives_Native.Some (e)) ty1 expect)
in (match (uu____2021) with
| (true, FStar_Pervasives_Native.Some (e')) -> begin
e'
end
| uu____2031 -> begin
((FStar_Extraction_ML_UEnv.debug g (fun uu____2043 -> (

let uu____2044 = (FStar_Extraction_ML_Code.string_of_mlexpr g.FStar_Extraction_ML_UEnv.currentModule e)
in (

let uu____2045 = (FStar_Extraction_ML_Code.string_of_mlty g.FStar_Extraction_ML_UEnv.currentModule ty1)
in (

let uu____2046 = (FStar_Extraction_ML_Code.string_of_mlty g.FStar_Extraction_ML_UEnv.currentModule expect)
in (FStar_Util.print3 "\n (*needed to coerce expression \n %s \n of type \n %s \n to type \n %s *) \n" uu____2044 uu____2045 uu____2046))))));
(match (ty1) with
| FStar_Extraction_ML_Syntax.MLTY_Erased -> begin
(default_value_for_ty g expect)
end
| uu____2047 -> begin
(

let uu____2048 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty expect) (FStar_Extraction_ML_Syntax.MLE_Coerce (((e), (ty1), (expect)))))
in (maybe_eta_expand expect uu____2048))
end);
)
end))))


let bv_as_mlty : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.bv  ->  FStar_Extraction_ML_Syntax.mlty = (fun g bv -> (

let uu____2059 = (FStar_Extraction_ML_UEnv.lookup_bv g bv)
in (match (uu____2059) with
| FStar_Util.Inl (uu____2060, t) -> begin
t
end
| uu____2074 -> begin
FStar_Extraction_ML_Syntax.MLTY_Top
end)))


let basic_norm_steps : FStar_TypeChecker_Normalize.step Prims.list = (FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Eager_unfolding)::(FStar_TypeChecker_Normalize.Iota)::(FStar_TypeChecker_Normalize.Zeta)::(FStar_TypeChecker_Normalize.Inlining)::(FStar_TypeChecker_Normalize.EraseUniverses)::(FStar_TypeChecker_Normalize.AllowUnboundUniverses)::[]


let rec translate_term_to_mlty : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Extraction_ML_Syntax.mlty = (fun g t0 -> (

let arg_as_mlty = (fun g1 uu____2119 -> (match (uu____2119) with
| (a, uu____2125) -> begin
(

let uu____2126 = (is_type g1 a)
in (match (uu____2126) with
| true -> begin
(translate_term_to_mlty g1 a)
end
| uu____2127 -> begin
FStar_Extraction_ML_UEnv.erasedContent
end))
end))
in (

let fv_app_as_mlty = (fun g1 fv args -> (

let uu____2144 = (

let uu____2145 = (FStar_Extraction_ML_UEnv.is_fv_type g1 fv)
in (not (uu____2145)))
in (match (uu____2144) with
| true -> begin
FStar_Extraction_ML_Syntax.MLTY_Top
end
| uu____2146 -> begin
(

let uu____2147 = (

let uu____2160 = (FStar_TypeChecker_Env.lookup_lid g1.FStar_Extraction_ML_UEnv.tcenv fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (match (uu____2160) with
| ((uu____2181, fvty), uu____2183) -> begin
(

let fvty1 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::[]) g1.FStar_Extraction_ML_UEnv.tcenv fvty)
in (FStar_Syntax_Util.arrow_formals fvty1))
end))
in (match (uu____2147) with
| (formals, uu____2190) -> begin
(

let mlargs = (FStar_List.map (arg_as_mlty g1) args)
in (

let mlargs1 = (

let n_args = (FStar_List.length args)
in (match (((FStar_List.length formals) > n_args)) with
| true -> begin
(

let uu____2236 = (FStar_Util.first_N n_args formals)
in (match (uu____2236) with
| (uu____2263, rest) -> begin
(

let uu____2289 = (FStar_List.map (fun uu____2297 -> FStar_Extraction_ML_UEnv.erasedContent) rest)
in (FStar_List.append mlargs uu____2289))
end))
end
| uu____2302 -> begin
mlargs
end))
in (

let nm = (

let uu____2304 = (FStar_Extraction_ML_UEnv.maybe_mangle_type_projector g1 fv)
in (match (uu____2304) with
| FStar_Pervasives_Native.Some (p) -> begin
p
end
| FStar_Pervasives_Native.None -> begin
(FStar_Extraction_ML_Syntax.mlpath_of_lident fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end))
in FStar_Extraction_ML_Syntax.MLTY_Named (((mlargs1), (nm))))))
end))
end)))
in (

let aux = (fun env t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_type (uu____2322) -> begin
FStar_Extraction_ML_Syntax.MLTY_Erased
end
| FStar_Syntax_Syntax.Tm_bvar (uu____2323) -> begin
(

let uu____2324 = (

let uu____2325 = (FStar_Syntax_Print.term_to_string t1)
in (FStar_Util.format1 "Impossible: Unexpected term %s" uu____2325))
in (failwith uu____2324))
end
| FStar_Syntax_Syntax.Tm_delayed (uu____2326) -> begin
(

let uu____2351 = (

let uu____2352 = (FStar_Syntax_Print.term_to_string t1)
in (FStar_Util.format1 "Impossible: Unexpected term %s" uu____2352))
in (failwith uu____2351))
end
| FStar_Syntax_Syntax.Tm_unknown -> begin
(

let uu____2353 = (

let uu____2354 = (FStar_Syntax_Print.term_to_string t1)
in (FStar_Util.format1 "Impossible: Unexpected term %s" uu____2354))
in (failwith uu____2353))
end
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____2356 = (FStar_Syntax_Util.unfold_lazy i)
in (translate_term_to_mlty env uu____2356))
end
| FStar_Syntax_Syntax.Tm_constant (uu____2357) -> begin
FStar_Extraction_ML_UEnv.unknownType
end
| FStar_Syntax_Syntax.Tm_quoted (uu____2358) -> begin
FStar_Extraction_ML_UEnv.unknownType
end
| FStar_Syntax_Syntax.Tm_uvar (uu____2365) -> begin
FStar_Extraction_ML_UEnv.unknownType
end
| FStar_Syntax_Syntax.Tm_meta (t2, uu____2367) -> begin
(translate_term_to_mlty env t2)
end
| FStar_Syntax_Syntax.Tm_refine ({FStar_Syntax_Syntax.ppname = uu____2372; FStar_Syntax_Syntax.index = uu____2373; FStar_Syntax_Syntax.sort = t2}, uu____2375) -> begin
(translate_term_to_mlty env t2)
end
| FStar_Syntax_Syntax.Tm_uinst (t2, uu____2383) -> begin
(translate_term_to_mlty env t2)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____2389, uu____2390) -> begin
(translate_term_to_mlty env t2)
end
| FStar_Syntax_Syntax.Tm_name (bv) -> begin
(bv_as_mlty env bv)
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(fv_app_as_mlty env fv [])
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____2457 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____2457) with
| (bs1, c1) -> begin
(

let uu____2464 = (binders_as_ml_binders env bs1)
in (match (uu____2464) with
| (mlbs, env1) -> begin
(

let t_ret = (

let eff = (FStar_TypeChecker_Env.norm_eff_name env1.FStar_Extraction_ML_UEnv.tcenv (FStar_Syntax_Util.comp_effect_name c1))
in (

let uu____2491 = (

let uu____2498 = (FStar_TypeChecker_Env.effect_decl_opt env1.FStar_Extraction_ML_UEnv.tcenv eff)
in (FStar_Util.must uu____2498))
in (match (uu____2491) with
| (ed, qualifiers) -> begin
(

let uu____2519 = (FStar_All.pipe_right qualifiers (FStar_List.contains FStar_Syntax_Syntax.Reifiable))
in (match (uu____2519) with
| true -> begin
(

let t2 = (FStar_TypeChecker_Env.reify_comp env1.FStar_Extraction_ML_UEnv.tcenv c1 FStar_Syntax_Syntax.U_unknown)
in (

let res = (translate_term_to_mlty env1 t2)
in res))
end
| uu____2524 -> begin
(translate_term_to_mlty env1 (FStar_Syntax_Util.comp_result c1))
end))
end)))
in (

let erase = (effect_as_etag env1 (FStar_Syntax_Util.comp_effect_name c1))
in (

let uu____2526 = (FStar_List.fold_right (fun uu____2545 uu____2546 -> (match (((uu____2545), (uu____2546))) with
| ((uu____2567, t2), (tag, t')) -> begin
((FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.MLTY_Fun (((t2), (tag), (t')))))
end)) mlbs ((erase), (t_ret)))
in (match (uu____2526) with
| (uu____2579, t2) -> begin
t2
end))))
end))
end))
end
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let res = (

let uu____2604 = (

let uu____2605 = (FStar_Syntax_Util.un_uinst head1)
in uu____2605.FStar_Syntax_Syntax.n)
in (match (uu____2604) with
| FStar_Syntax_Syntax.Tm_name (bv) -> begin
(bv_as_mlty env bv)
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(fv_app_as_mlty env fv args)
end
| FStar_Syntax_Syntax.Tm_app (head2, args') -> begin
(

let uu____2632 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((head2), ((FStar_List.append args' args))))) FStar_Pervasives_Native.None t1.FStar_Syntax_Syntax.pos)
in (translate_term_to_mlty env uu____2632))
end
| uu____2649 -> begin
FStar_Extraction_ML_UEnv.unknownType
end))
in res)
end
| FStar_Syntax_Syntax.Tm_abs (bs, ty, uu____2652) -> begin
(

let uu____2673 = (FStar_Syntax_Subst.open_term bs ty)
in (match (uu____2673) with
| (bs1, ty1) -> begin
(

let uu____2680 = (binders_as_ml_binders env bs1)
in (match (uu____2680) with
| (bts, env1) -> begin
(translate_term_to_mlty env1 ty1)
end))
end))
end
| FStar_Syntax_Syntax.Tm_let (uu____2705) -> begin
FStar_Extraction_ML_UEnv.unknownType
end
| FStar_Syntax_Syntax.Tm_match (uu____2718) -> begin
FStar_Extraction_ML_UEnv.unknownType
end)))
in (

let rec is_top_ty = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Top -> begin
true
end
| FStar_Extraction_ML_Syntax.MLTY_Named (uu____2747) -> begin
(

let uu____2754 = (FStar_Extraction_ML_Util.udelta_unfold g t)
in (match (uu____2754) with
| FStar_Pervasives_Native.None -> begin
false
end
| FStar_Pervasives_Native.Some (t1) -> begin
(is_top_ty t1)
end))
end
| uu____2758 -> begin
false
end))
in (

let uu____2759 = (FStar_TypeChecker_Util.must_erase_for_extraction g.FStar_Extraction_ML_UEnv.tcenv t0)
in (match (uu____2759) with
| true -> begin
FStar_Extraction_ML_Syntax.MLTY_Erased
end
| uu____2760 -> begin
(

let mlt = (aux g t0)
in (

let uu____2762 = (is_top_ty mlt)
in (match (uu____2762) with
| true -> begin
(

let t = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::basic_norm_steps) g.FStar_Extraction_ML_UEnv.tcenv t0)
in (aux g t))
end
| uu____2764 -> begin
mlt
end)))
end)))))))
and binders_as_ml_binders : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.binders  ->  ((FStar_Extraction_ML_Syntax.mlident * FStar_Extraction_ML_Syntax.mlty) Prims.list * FStar_Extraction_ML_UEnv.env) = (fun g bs -> (

let uu____2777 = (FStar_All.pipe_right bs (FStar_List.fold_left (fun uu____2826 b -> (match (uu____2826) with
| (ml_bs, env) -> begin
(

let uu____2866 = (is_type_binder g b)
in (match (uu____2866) with
| true -> begin
(

let b1 = (FStar_Pervasives_Native.fst b)
in (

let env1 = (FStar_Extraction_ML_UEnv.extend_ty env b1 (FStar_Pervasives_Native.Some (FStar_Extraction_ML_Syntax.MLTY_Top)))
in (

let ml_b = (

let uu____2884 = (FStar_Extraction_ML_UEnv.bv_as_ml_termvar b1)
in ((uu____2884), (FStar_Extraction_ML_Syntax.ml_unit_ty)))
in (((ml_b)::ml_bs), (env1)))))
end
| uu____2895 -> begin
(

let b1 = (FStar_Pervasives_Native.fst b)
in (

let t = (translate_term_to_mlty env b1.FStar_Syntax_Syntax.sort)
in (

let uu____2898 = (FStar_Extraction_ML_UEnv.extend_bv env b1 (([]), (t)) false false false)
in (match (uu____2898) with
| (env1, b2) -> begin
(

let ml_b = (

let uu____2920 = (FStar_Extraction_ML_UEnv.removeTick b2)
in ((uu____2920), (t)))
in (((ml_b)::ml_bs), (env1)))
end))))
end))
end)) (([]), (g))))
in (match (uu____2777) with
| (ml_bs, env) -> begin
(((FStar_List.rev ml_bs)), (env))
end)))


let term_as_mlty : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Extraction_ML_Syntax.mlty = (fun g t0 -> (

let t = (FStar_TypeChecker_Normalize.normalize basic_norm_steps g.FStar_Extraction_ML_UEnv.tcenv t0)
in (translate_term_to_mlty g t)))


let mk_MLE_Seq : FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.mlexpr' = (fun e1 e2 -> (match (((e1.FStar_Extraction_ML_Syntax.expr), (e2.FStar_Extraction_ML_Syntax.expr))) with
| (FStar_Extraction_ML_Syntax.MLE_Seq (es1), FStar_Extraction_ML_Syntax.MLE_Seq (es2)) -> begin
FStar_Extraction_ML_Syntax.MLE_Seq ((FStar_List.append es1 es2))
end
| (FStar_Extraction_ML_Syntax.MLE_Seq (es1), uu____3003) -> begin
FStar_Extraction_ML_Syntax.MLE_Seq ((FStar_List.append es1 ((e2)::[])))
end
| (uu____3006, FStar_Extraction_ML_Syntax.MLE_Seq (es2)) -> begin
FStar_Extraction_ML_Syntax.MLE_Seq ((e1)::es2)
end
| uu____3010 -> begin
FStar_Extraction_ML_Syntax.MLE_Seq ((e1)::(e2)::[])
end))


let mk_MLE_Let : Prims.bool  ->  FStar_Extraction_ML_Syntax.mlletbinding  ->  FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.mlexpr' = (fun top_level lbs body -> (match (lbs) with
| (FStar_Extraction_ML_Syntax.NonRec, (lb)::[]) when (not (top_level)) -> begin
(match (lb.FStar_Extraction_ML_Syntax.mllb_tysc) with
| FStar_Pervasives_Native.Some ([], t) when (Prims.op_Equality t FStar_Extraction_ML_Syntax.ml_unit_ty) -> begin
(match ((Prims.op_Equality body.FStar_Extraction_ML_Syntax.expr FStar_Extraction_ML_Syntax.ml_unit.FStar_Extraction_ML_Syntax.expr)) with
| true -> begin
lb.FStar_Extraction_ML_Syntax.mllb_def.FStar_Extraction_ML_Syntax.expr
end
| uu____3034 -> begin
(match (body.FStar_Extraction_ML_Syntax.expr) with
| FStar_Extraction_ML_Syntax.MLE_Var (x) when (Prims.op_Equality x lb.FStar_Extraction_ML_Syntax.mllb_name) -> begin
lb.FStar_Extraction_ML_Syntax.mllb_def.FStar_Extraction_ML_Syntax.expr
end
| uu____3036 when (Prims.op_Equality lb.FStar_Extraction_ML_Syntax.mllb_def.FStar_Extraction_ML_Syntax.expr FStar_Extraction_ML_Syntax.ml_unit.FStar_Extraction_ML_Syntax.expr) -> begin
body.FStar_Extraction_ML_Syntax.expr
end
| uu____3037 -> begin
(mk_MLE_Seq lb.FStar_Extraction_ML_Syntax.mllb_def body)
end)
end)
end
| uu____3038 -> begin
FStar_Extraction_ML_Syntax.MLE_Let (((lbs), (body)))
end)
end
| uu____3047 -> begin
FStar_Extraction_ML_Syntax.MLE_Let (((lbs), (body)))
end))


let resugar_pat : FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option  ->  FStar_Extraction_ML_Syntax.mlpattern  ->  FStar_Extraction_ML_Syntax.mlpattern = (fun q p -> (match (p) with
| FStar_Extraction_ML_Syntax.MLP_CTor (d, pats) -> begin
(

let uu____3074 = (FStar_Extraction_ML_Util.is_xtuple d)
in (match (uu____3074) with
| FStar_Pervasives_Native.Some (n1) -> begin
FStar_Extraction_ML_Syntax.MLP_Tuple (pats)
end
| uu____3078 -> begin
(match (q) with
| FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (ty, fns)) -> begin
(

let path = (FStar_List.map FStar_Ident.text_of_id ty.FStar_Ident.ns)
in (

let fs = (record_fields fns pats)
in FStar_Extraction_ML_Syntax.MLP_Record (((path), (fs)))))
end
| uu____3105 -> begin
p
end)
end))
end
| uu____3108 -> begin
p
end))


let rec extract_one_pat : Prims.bool  ->  FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.pat  ->  FStar_Extraction_ML_Syntax.mlty FStar_Pervasives_Native.option  ->  (FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag * FStar_Extraction_ML_Syntax.mlty))  ->  (FStar_Extraction_ML_UEnv.env * (FStar_Extraction_ML_Syntax.mlpattern * FStar_Extraction_ML_Syntax.mlexpr Prims.list) FStar_Pervasives_Native.option * Prims.bool) = (fun imp g p expected_topt term_as_mlexpr -> (

let ok = (fun t -> (match (expected_topt) with
| FStar_Pervasives_Native.None -> begin
true
end
| FStar_Pervasives_Native.Some (t') -> begin
(

let ok = (type_leq g t t')
in ((match ((not (ok))) with
| true -> begin
(FStar_Extraction_ML_UEnv.debug g (fun uu____3200 -> (

let uu____3201 = (FStar_Extraction_ML_Code.string_of_mlty g.FStar_Extraction_ML_UEnv.currentModule t')
in (

let uu____3202 = (FStar_Extraction_ML_Code.string_of_mlty g.FStar_Extraction_ML_UEnv.currentModule t)
in (FStar_Util.print2 "Expected pattern type %s; got pattern type %s\n" uu____3201 uu____3202)))))
end
| uu____3203 -> begin
()
end);
ok;
))
end))
in (match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_int (c, swopt)) when (

let uu____3232 = (FStar_Options.codegen ())
in (Prims.op_disEquality uu____3232 (FStar_Pervasives_Native.Some (FStar_Options.Kremlin)))) -> begin
(

let uu____3237 = (match (swopt) with
| FStar_Pervasives_Native.None -> begin
(

let uu____3250 = (

let uu____3251 = (

let uu____3252 = (FStar_Extraction_ML_Util.mlconst_of_const p.FStar_Syntax_Syntax.p (FStar_Const.Const_int (((c), (FStar_Pervasives_Native.None)))))
in FStar_Extraction_ML_Syntax.MLE_Const (uu____3252))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_int_ty) uu____3251))
in ((uu____3250), (FStar_Extraction_ML_Syntax.ml_int_ty)))
end
| FStar_Pervasives_Native.Some (sw) -> begin
(

let source_term = (FStar_ToSyntax_ToSyntax.desugar_machine_integer g.FStar_Extraction_ML_UEnv.tcenv.FStar_TypeChecker_Env.dsenv c sw FStar_Range.dummyRange)
in (

let uu____3273 = (term_as_mlexpr g source_term)
in (match (uu____3273) with
| (mlterm, uu____3285, mlty) -> begin
((mlterm), (mlty))
end)))
end)
in (match (uu____3237) with
| (mlc, ml_ty) -> begin
(

let x = (FStar_Extraction_ML_Syntax.gensym ())
in (

let when_clause = (

let uu____3305 = (

let uu____3306 = (

let uu____3313 = (

let uu____3316 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty ml_ty) (FStar_Extraction_ML_Syntax.MLE_Var (x)))
in (uu____3316)::(mlc)::[])
in ((FStar_Extraction_ML_Util.prims_op_equality), (uu____3313)))
in FStar_Extraction_ML_Syntax.MLE_App (uu____3306))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_bool_ty) uu____3305))
in (

let uu____3319 = (ok ml_ty)
in ((g), (FStar_Pervasives_Native.Some (((FStar_Extraction_ML_Syntax.MLP_Var (x)), ((when_clause)::[])))), (uu____3319)))))
end))
end
| FStar_Syntax_Syntax.Pat_constant (s) -> begin
(

let t = (FStar_TypeChecker_TcTerm.tc_constant g.FStar_Extraction_ML_UEnv.tcenv FStar_Range.dummyRange s)
in (

let mlty = (term_as_mlty g t)
in (

let uu____3339 = (

let uu____3348 = (

let uu____3355 = (

let uu____3356 = (FStar_Extraction_ML_Util.mlconst_of_const p.FStar_Syntax_Syntax.p s)
in FStar_Extraction_ML_Syntax.MLP_Const (uu____3356))
in ((uu____3355), ([])))
in FStar_Pervasives_Native.Some (uu____3348))
in (

let uu____3365 = (ok mlty)
in ((g), (uu____3339), (uu____3365))))))
end
| FStar_Syntax_Syntax.Pat_var (x) -> begin
(

let mlty = (term_as_mlty g x.FStar_Syntax_Syntax.sort)
in (

let uu____3376 = (FStar_Extraction_ML_UEnv.extend_bv g x (([]), (mlty)) false false imp)
in (match (uu____3376) with
| (g1, x1) -> begin
(

let uu____3397 = (ok mlty)
in ((g1), ((match (imp) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____3420 -> begin
FStar_Pervasives_Native.Some (((FStar_Extraction_ML_Syntax.MLP_Var (x1)), ([])))
end)), (uu____3397)))
end)))
end
| FStar_Syntax_Syntax.Pat_wild (x) -> begin
(

let mlty = (term_as_mlty g x.FStar_Syntax_Syntax.sort)
in (

let uu____3431 = (FStar_Extraction_ML_UEnv.extend_bv g x (([]), (mlty)) false false imp)
in (match (uu____3431) with
| (g1, x1) -> begin
(

let uu____3452 = (ok mlty)
in ((g1), ((match (imp) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____3475 -> begin
FStar_Pervasives_Native.Some (((FStar_Extraction_ML_Syntax.MLP_Var (x1)), ([])))
end)), (uu____3452)))
end)))
end
| FStar_Syntax_Syntax.Pat_dot_term (uu____3484) -> begin
((g), (FStar_Pervasives_Native.None), (true))
end
| FStar_Syntax_Syntax.Pat_cons (f, pats) -> begin
(

let uu____3523 = (

let uu____3532 = (FStar_Extraction_ML_UEnv.lookup_fv g f)
in (match (uu____3532) with
| FStar_Util.Inr (uu____3541, {FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (n1); FStar_Extraction_ML_Syntax.mlty = uu____3543; FStar_Extraction_ML_Syntax.loc = uu____3544}, ttys, uu____3546) -> begin
((n1), (ttys))
end
| uu____3559 -> begin
(failwith "Expected a constructor")
end))
in (match (uu____3523) with
| (d, tys) -> begin
(

let nTyVars = (FStar_List.length (FStar_Pervasives_Native.fst tys))
in (

let uu____3595 = (FStar_Util.first_N nTyVars pats)
in (match (uu____3595) with
| (tysVarPats, restPats) -> begin
(

let f_ty_opt = (FStar_All.try_with (fun uu___66_3695 -> (match (()) with
| () -> begin
(

let mlty_args = (FStar_All.pipe_right tysVarPats (FStar_List.map (fun uu____3724 -> (match (uu____3724) with
| (p1, uu____3730) -> begin
(match (p1.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_dot_term (uu____3731, t) -> begin
(term_as_mlty g t)
end
| uu____3737 -> begin
((FStar_Extraction_ML_UEnv.debug g (fun uu____3741 -> (

let uu____3742 = (FStar_Syntax_Print.pat_to_string p1)
in (FStar_Util.print1 "Pattern %s is not extractable" uu____3742))));
(FStar_Exn.raise Un_extractable);
)
end)
end))))
in (

let f_ty = (FStar_Extraction_ML_Util.subst tys mlty_args)
in (

let uu____3744 = (FStar_Extraction_ML_Util.uncurry_mlty_fun f_ty)
in FStar_Pervasives_Native.Some (uu____3744))))
end)) (fun uu___65_3758 -> (match (uu___65_3758) with
| Un_extractable -> begin
FStar_Pervasives_Native.None
end)))
in (

let uu____3773 = (FStar_Util.fold_map (fun g1 uu____3809 -> (match (uu____3809) with
| (p1, imp1) -> begin
(

let uu____3828 = (extract_one_pat true g1 p1 FStar_Pervasives_Native.None term_as_mlexpr)
in (match (uu____3828) with
| (g2, p2, uu____3857) -> begin
((g2), (p2))
end))
end)) g tysVarPats)
in (match (uu____3773) with
| (g1, tyMLPats) -> begin
(

let uu____3918 = (FStar_Util.fold_map (fun uu____3982 uu____3983 -> (match (((uu____3982), (uu____3983))) with
| ((g2, f_ty_opt1), (p1, imp1)) -> begin
(

let uu____4076 = (match (f_ty_opt1) with
| FStar_Pervasives_Native.Some ((hd1)::rest, res) -> begin
((FStar_Pervasives_Native.Some (((rest), (res)))), (FStar_Pervasives_Native.Some (hd1)))
end
| uu____4136 -> begin
((FStar_Pervasives_Native.None), (FStar_Pervasives_Native.None))
end)
in (match (uu____4076) with
| (f_ty_opt2, expected_ty) -> begin
(

let uu____4207 = (extract_one_pat false g2 p1 expected_ty term_as_mlexpr)
in (match (uu____4207) with
| (g3, p2, uu____4248) -> begin
((((g3), (f_ty_opt2))), (p2))
end))
end))
end)) ((g1), (f_ty_opt)) restPats)
in (match (uu____3918) with
| ((g2, f_ty_opt1), restMLPats) -> begin
(

let uu____4366 = (

let uu____4377 = (FStar_All.pipe_right (FStar_List.append tyMLPats restMLPats) (FStar_List.collect (fun uu___62_4428 -> (match (uu___62_4428) with
| FStar_Pervasives_Native.Some (x) -> begin
(x)::[]
end
| uu____4470 -> begin
[]
end))))
in (FStar_All.pipe_right uu____4377 FStar_List.split))
in (match (uu____4366) with
| (mlPats, when_clauses) -> begin
(

let pat_ty_compat = (match (f_ty_opt1) with
| FStar_Pervasives_Native.Some ([], t) -> begin
(ok t)
end
| uu____4543 -> begin
false
end)
in (

let uu____4552 = (

let uu____4561 = (

let uu____4568 = (resugar_pat f.FStar_Syntax_Syntax.fv_qual (FStar_Extraction_ML_Syntax.MLP_CTor (((d), (mlPats)))))
in (

let uu____4571 = (FStar_All.pipe_right when_clauses FStar_List.flatten)
in ((uu____4568), (uu____4571))))
in FStar_Pervasives_Native.Some (uu____4561))
in ((g2), (uu____4552), (pat_ty_compat))))
end))
end))
end)))
end)))
end))
end)))


let extract_pat : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.pat  ->  FStar_Extraction_ML_Syntax.mlty  ->  (FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag * FStar_Extraction_ML_Syntax.mlty))  ->  (FStar_Extraction_ML_UEnv.env * (FStar_Extraction_ML_Syntax.mlpattern * FStar_Extraction_ML_Syntax.mlexpr FStar_Pervasives_Native.option) Prims.list * Prims.bool) = (fun g p expected_t term_as_mlexpr -> (

let extract_one_pat1 = (fun g1 p1 expected_t1 -> (

let uu____4698 = (extract_one_pat false g1 p1 expected_t1 term_as_mlexpr)
in (match (uu____4698) with
| (g2, FStar_Pervasives_Native.Some (x, v1), b) -> begin
((g2), (((x), (v1))), (b))
end
| uu____4755 -> begin
(failwith "Impossible: Unable to translate pattern")
end)))
in (

let mk_when_clause = (fun whens -> (match (whens) with
| [] -> begin
FStar_Pervasives_Native.None
end
| (hd1)::tl1 -> begin
(

let uu____4800 = (FStar_List.fold_left FStar_Extraction_ML_Util.conjoin hd1 tl1)
in FStar_Pervasives_Native.Some (uu____4800))
end))
in (

let uu____4801 = (extract_one_pat1 g p (FStar_Pervasives_Native.Some (expected_t)))
in (match (uu____4801) with
| (g1, (p1, whens), b) -> begin
(

let when_clause = (mk_when_clause whens)
in ((g1), ((((p1), (when_clause)))::[]), (b)))
end)))))


let maybe_eta_data_and_project_record : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option  ->  FStar_Extraction_ML_Syntax.mlty  ->  FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.mlexpr = (fun g qual residualType mlAppExpr -> (

let rec eta_args = (fun more_args t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Fun (t0, uu____4951, t1) -> begin
(

let x = (FStar_Extraction_ML_Syntax.gensym ())
in (

let uu____4954 = (

let uu____4965 = (

let uu____4974 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t0) (FStar_Extraction_ML_Syntax.MLE_Var (x)))
in ((((x), (t0))), (uu____4974)))
in (uu____4965)::more_args)
in (eta_args uu____4954 t1)))
end
| FStar_Extraction_ML_Syntax.MLTY_Named (uu____4987, uu____4988) -> begin
(((FStar_List.rev more_args)), (t))
end
| uu____5011 -> begin
(

let uu____5012 = (

let uu____5013 = (FStar_Extraction_ML_Code.string_of_mlexpr g.FStar_Extraction_ML_UEnv.currentModule mlAppExpr)
in (

let uu____5014 = (FStar_Extraction_ML_Code.string_of_mlty g.FStar_Extraction_ML_UEnv.currentModule t)
in (FStar_Util.format2 "Impossible: Head type is not an arrow: (%s : %s)" uu____5013 uu____5014)))
in (failwith uu____5012))
end))
in (

let as_record = (fun qual1 e -> (match (((e.FStar_Extraction_ML_Syntax.expr), (qual1))) with
| (FStar_Extraction_ML_Syntax.MLE_CTor (uu____5046, args), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (tyname, fields))) -> begin
(

let path = (FStar_List.map FStar_Ident.text_of_id tyname.FStar_Ident.ns)
in (

let fields1 = (record_fields fields args)
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty e.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_Record (((path), (fields1)))))))
end
| uu____5078 -> begin
e
end))
in (

let resugar_and_maybe_eta = (fun qual1 e -> (

let uu____5100 = (eta_args [] residualType)
in (match (uu____5100) with
| (eargs, tres) -> begin
(match (eargs) with
| [] -> begin
(

let uu____5153 = (as_record qual1 e)
in (FStar_Extraction_ML_Util.resugar_exp uu____5153))
end
| uu____5154 -> begin
(

let uu____5165 = (FStar_List.unzip eargs)
in (match (uu____5165) with
| (binders, eargs1) -> begin
(match (e.FStar_Extraction_ML_Syntax.expr) with
| FStar_Extraction_ML_Syntax.MLE_CTor (head1, args) -> begin
(

let body = (

let uu____5207 = (

let uu____5208 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty tres) (FStar_Extraction_ML_Syntax.MLE_CTor (((head1), ((FStar_List.append args eargs1))))))
in (FStar_All.pipe_left (as_record qual1) uu____5208))
in (FStar_All.pipe_left FStar_Extraction_ML_Util.resugar_exp uu____5207))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty e.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_Fun (((binders), (body))))))
end
| uu____5217 -> begin
(failwith "Impossible: Not a constructor")
end)
end))
end)
end)))
in (match (((mlAppExpr.FStar_Extraction_ML_Syntax.expr), (qual))) with
| (uu____5220, FStar_Pervasives_Native.None) -> begin
mlAppExpr
end
| (FStar_Extraction_ML_Syntax.MLE_App ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5224; FStar_Extraction_ML_Syntax.loc = uu____5225}, (mle)::args), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_projector (constrname, f))) -> begin
(

let f1 = (FStar_Ident.lid_of_ids (FStar_List.append constrname.FStar_Ident.ns ((f)::[])))
in (

let fn = (FStar_Extraction_ML_Util.mlpath_of_lid f1)
in (

let proj = FStar_Extraction_ML_Syntax.MLE_Proj (((mle), (fn)))
in (

let e = (match (args) with
| [] -> begin
proj
end
| uu____5246 -> begin
(

let uu____5249 = (

let uu____5256 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.MLTY_Top) proj)
in ((uu____5256), (args)))
in FStar_Extraction_ML_Syntax.MLE_App (uu____5249))
end)
in (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty e)))))
end
| (FStar_Extraction_ML_Syntax.MLE_App ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_TApp ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5260; FStar_Extraction_ML_Syntax.loc = uu____5261}, uu____5262); FStar_Extraction_ML_Syntax.mlty = uu____5263; FStar_Extraction_ML_Syntax.loc = uu____5264}, (mle)::args), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_projector (constrname, f))) -> begin
(

let f1 = (FStar_Ident.lid_of_ids (FStar_List.append constrname.FStar_Ident.ns ((f)::[])))
in (

let fn = (FStar_Extraction_ML_Util.mlpath_of_lid f1)
in (

let proj = FStar_Extraction_ML_Syntax.MLE_Proj (((mle), (fn)))
in (

let e = (match (args) with
| [] -> begin
proj
end
| uu____5289 -> begin
(

let uu____5292 = (

let uu____5299 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.MLTY_Top) proj)
in ((uu____5299), (args)))
in FStar_Extraction_ML_Syntax.MLE_App (uu____5292))
end)
in (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty e)))))
end
| (FStar_Extraction_ML_Syntax.MLE_App ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5303; FStar_Extraction_ML_Syntax.loc = uu____5304}, mlargs), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) -> begin
(

let uu____5312 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), (mlargs)))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5312))
end
| (FStar_Extraction_ML_Syntax.MLE_App ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5316; FStar_Extraction_ML_Syntax.loc = uu____5317}, mlargs), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (uu____5319))) -> begin
(

let uu____5332 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), (mlargs)))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5332))
end
| (FStar_Extraction_ML_Syntax.MLE_App ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_TApp ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5336; FStar_Extraction_ML_Syntax.loc = uu____5337}, uu____5338); FStar_Extraction_ML_Syntax.mlty = uu____5339; FStar_Extraction_ML_Syntax.loc = uu____5340}, mlargs), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) -> begin
(

let uu____5352 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), (mlargs)))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5352))
end
| (FStar_Extraction_ML_Syntax.MLE_App ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_TApp ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5356; FStar_Extraction_ML_Syntax.loc = uu____5357}, uu____5358); FStar_Extraction_ML_Syntax.mlty = uu____5359; FStar_Extraction_ML_Syntax.loc = uu____5360}, mlargs), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (uu____5362))) -> begin
(

let uu____5379 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), (mlargs)))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5379))
end
| (FStar_Extraction_ML_Syntax.MLE_Name (mlp), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) -> begin
(

let uu____5385 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), ([])))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5385))
end
| (FStar_Extraction_ML_Syntax.MLE_Name (mlp), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (uu____5389))) -> begin
(

let uu____5398 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), ([])))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5398))
end
| (FStar_Extraction_ML_Syntax.MLE_TApp ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5402; FStar_Extraction_ML_Syntax.loc = uu____5403}, uu____5404), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) -> begin
(

let uu____5411 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), ([])))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5411))
end
| (FStar_Extraction_ML_Syntax.MLE_TApp ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Name (mlp); FStar_Extraction_ML_Syntax.mlty = uu____5415; FStar_Extraction_ML_Syntax.loc = uu____5416}, uu____5417), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (uu____5418))) -> begin
(

let uu____5431 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty mlAppExpr.FStar_Extraction_ML_Syntax.mlty) (FStar_Extraction_ML_Syntax.MLE_CTor (((mlp), ([])))))
in (FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____5431))
end
| uu____5434 -> begin
mlAppExpr
end)))))


let maybe_promote_effect : FStar_Extraction_ML_Syntax.mlexpr  ->  FStar_Extraction_ML_Syntax.e_tag  ->  FStar_Extraction_ML_Syntax.mlty  ->  (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag) = (fun ml_e tag t -> (match (((tag), (t))) with
| (FStar_Extraction_ML_Syntax.E_GHOST, FStar_Extraction_ML_Syntax.MLTY_Erased) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE))
end
| (FStar_Extraction_ML_Syntax.E_PURE, FStar_Extraction_ML_Syntax.MLTY_Erased) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE))
end
| uu____5464 -> begin
((ml_e), (tag))
end))


type generalized_lb =
(FStar_Syntax_Syntax.lbname * FStar_Extraction_ML_Syntax.e_tag * (FStar_Syntax_Syntax.typ * (FStar_Syntax_Syntax.binders * FStar_Extraction_ML_Syntax.mltyscheme)) * Prims.bool * FStar_Syntax_Syntax.term)


let rec check_term_as_mlexpr : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Extraction_ML_Syntax.e_tag  ->  FStar_Extraction_ML_Syntax.mlty  ->  (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.mlty) = (fun g e f ty -> ((FStar_Extraction_ML_UEnv.debug g (fun uu____5547 -> (

let uu____5548 = (FStar_Syntax_Print.term_to_string e)
in (

let uu____5549 = (FStar_Extraction_ML_Code.string_of_mlty g.FStar_Extraction_ML_UEnv.currentModule ty)
in (FStar_Util.print2 "Checking %s at type %s\n" uu____5548 uu____5549)))));
(match (((f), (ty))) with
| (FStar_Extraction_ML_Syntax.E_GHOST, uu____5554) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.MLTY_Erased))
end
| (FStar_Extraction_ML_Syntax.E_PURE, FStar_Extraction_ML_Syntax.MLTY_Erased) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.MLTY_Erased))
end
| uu____5555 -> begin
(

let uu____5560 = (term_as_mlexpr g e)
in (match (uu____5560) with
| (ml_e, tag, t) -> begin
(

let uu____5574 = (maybe_promote_effect ml_e tag t)
in (match (uu____5574) with
| (ml_e1, tag1) -> begin
(

let uu____5585 = (FStar_Extraction_ML_Util.eff_leq tag1 f)
in (match (uu____5585) with
| true -> begin
(

let uu____5590 = (maybe_coerce e.FStar_Syntax_Syntax.pos g ml_e1 t ty)
in ((uu____5590), (ty)))
end
| uu____5591 -> begin
(match (((tag1), (f), (ty))) with
| (FStar_Extraction_ML_Syntax.E_GHOST, FStar_Extraction_ML_Syntax.E_PURE, FStar_Extraction_ML_Syntax.MLTY_Erased) -> begin
(

let uu____5596 = (maybe_coerce e.FStar_Syntax_Syntax.pos g ml_e1 t ty)
in ((uu____5596), (ty)))
end
| uu____5597 -> begin
((err_unexpected_eff g e ty f tag1);
(

let uu____5605 = (maybe_coerce e.FStar_Syntax_Syntax.pos g ml_e1 t ty)
in ((uu____5605), (ty)));
)
end)
end))
end))
end))
end);
))
and term_as_mlexpr : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag * FStar_Extraction_ML_Syntax.mlty) = (fun g e -> (

let uu____5608 = (term_as_mlexpr' g e)
in (match (uu____5608) with
| (e1, f, t) -> begin
(

let uu____5624 = (maybe_promote_effect e1 f t)
in (match (uu____5624) with
| (e2, f1) -> begin
((e2), (f1), (t))
end))
end)))
and term_as_mlexpr' : FStar_Extraction_ML_UEnv.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag * FStar_Extraction_ML_Syntax.mlty) = (fun g top -> ((FStar_Extraction_ML_UEnv.debug g (fun u -> (

let uu____5649 = (

let uu____5650 = (FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos)
in (

let uu____5651 = (FStar_Syntax_Print.tag_of_term top)
in (

let uu____5652 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.format3 "%s: term_as_mlexpr\' (%s) :  %s \n" uu____5650 uu____5651 uu____5652))))
in (FStar_Util.print_string uu____5649))));
(

let t = (FStar_Syntax_Subst.compress top)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
(

let uu____5660 = (

let uu____5661 = (FStar_Syntax_Print.tag_of_term t)
in (FStar_Util.format1 "Impossible: Unexpected term: %s" uu____5661))
in (failwith uu____5660))
end
| FStar_Syntax_Syntax.Tm_delayed (uu____5668) -> begin
(

let uu____5693 = (

let uu____5694 = (FStar_Syntax_Print.tag_of_term t)
in (FStar_Util.format1 "Impossible: Unexpected term: %s" uu____5694))
in (failwith uu____5693))
end
| FStar_Syntax_Syntax.Tm_uvar (uu____5701) -> begin
(

let uu____5702 = (

let uu____5703 = (FStar_Syntax_Print.tag_of_term t)
in (FStar_Util.format1 "Impossible: Unexpected term: %s" uu____5703))
in (failwith uu____5702))
end
| FStar_Syntax_Syntax.Tm_bvar (uu____5710) -> begin
(

let uu____5711 = (

let uu____5712 = (FStar_Syntax_Print.tag_of_term t)
in (FStar_Util.format1 "Impossible: Unexpected term: %s" uu____5712))
in (failwith uu____5711))
end
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____5720 = (FStar_Syntax_Util.unfold_lazy i)
in (term_as_mlexpr g uu____5720))
end
| FStar_Syntax_Syntax.Tm_type (uu____5721) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| FStar_Syntax_Syntax.Tm_refine (uu____5722) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| FStar_Syntax_Syntax.Tm_arrow (uu____5729) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| FStar_Syntax_Syntax.Tm_quoted (qt, {FStar_Syntax_Syntax.qkind = FStar_Syntax_Syntax.Quote_dynamic; FStar_Syntax_Syntax.antiquotes = uu____5743}) -> begin
(

let uu____5758 = (

let uu____5767 = (

let uu____5784 = (FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.failwith_lid FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)
in (FStar_Extraction_ML_UEnv.lookup_fv g uu____5784))
in (FStar_All.pipe_left FStar_Util.right uu____5767))
in (match (uu____5758) with
| (uu____5827, fw, uu____5829, uu____5830) -> begin
(

let uu____5831 = (

let uu____5832 = (

let uu____5833 = (

let uu____5840 = (

let uu____5843 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_string_ty) (FStar_Extraction_ML_Syntax.MLE_Const (FStar_Extraction_ML_Syntax.MLC_String ("Open quotation at runtime"))))
in (uu____5843)::[])
in ((fw), (uu____5840)))
in FStar_Extraction_ML_Syntax.MLE_App (uu____5833))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_int_ty) uu____5832))
in ((uu____5831), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_int_ty)))
end))
end
| FStar_Syntax_Syntax.Tm_quoted (qt, {FStar_Syntax_Syntax.qkind = FStar_Syntax_Syntax.Quote_static; FStar_Syntax_Syntax.antiquotes = aqs}) -> begin
(

let uu____5862 = (FStar_Reflection_Basic.inspect_ln qt)
in (match (uu____5862) with
| FStar_Reflection_Data.Tv_Var (bv) -> begin
(

let uu____5870 = (FStar_Syntax_Syntax.lookup_aq bv aqs)
in (match (uu____5870) with
| FStar_Pervasives_Native.Some (false, tm) -> begin
(term_as_mlexpr g tm)
end
| FStar_Pervasives_Native.Some (true, tm) -> begin
(

let uu____5893 = (

let uu____5902 = (

let uu____5919 = (FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.failwith_lid FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)
in (FStar_Extraction_ML_UEnv.lookup_fv g uu____5919))
in (FStar_All.pipe_left FStar_Util.right uu____5902))
in (match (uu____5893) with
| (uu____5962, fw, uu____5964, uu____5965) -> begin
(

let uu____5966 = (

let uu____5967 = (

let uu____5968 = (

let uu____5975 = (

let uu____5978 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_string_ty) (FStar_Extraction_ML_Syntax.MLE_Const (FStar_Extraction_ML_Syntax.MLC_String ("Open quotation at runtime"))))
in (uu____5978)::[])
in ((fw), (uu____5975)))
in FStar_Extraction_ML_Syntax.MLE_App (uu____5968))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_int_ty) uu____5967))
in ((uu____5966), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_int_ty)))
end))
end
| FStar_Pervasives_Native.None -> begin
(

let tv = (

let uu____5986 = (FStar_Reflection_Embeddings.e_term_view_aq aqs)
in (FStar_Syntax_Embeddings.embed uu____5986 t.FStar_Syntax_Syntax.pos (FStar_Reflection_Data.Tv_Var (bv))))
in (

let t1 = (

let uu____5992 = (

let uu____6001 = (FStar_Syntax_Syntax.as_arg tv)
in (uu____6001)::[])
in (FStar_Syntax_Util.mk_app (FStar_Reflection_Data.refl_constant_term FStar_Reflection_Data.fstar_refl_pack_ln) uu____5992))
in (term_as_mlexpr g t1)))
end))
end
| tv -> begin
(

let tv1 = (

let uu____6022 = (FStar_Reflection_Embeddings.e_term_view_aq aqs)
in (FStar_Syntax_Embeddings.embed uu____6022 t.FStar_Syntax_Syntax.pos tv))
in (

let t1 = (

let uu____6028 = (

let uu____6037 = (FStar_Syntax_Syntax.as_arg tv1)
in (uu____6037)::[])
in (FStar_Syntax_Util.mk_app (FStar_Reflection_Data.refl_constant_term FStar_Reflection_Data.fstar_refl_pack_ln) uu____6028))
in (term_as_mlexpr g t1)))
end))
end
| FStar_Syntax_Syntax.Tm_meta (t1, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Mutable_alloc)) -> begin
(FStar_Errors.raise_err ((FStar_Errors.Error_NoLetMutable), ("let-mutable no longer supported")))
end
| FStar_Syntax_Syntax.Tm_meta (t1, FStar_Syntax_Syntax.Meta_monadic (m, uu____6069)) -> begin
(

let t2 = (FStar_Syntax_Subst.compress t1)
in (match (t2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) when (FStar_Util.is_left lb.FStar_Syntax_Syntax.lbname) -> begin
(

let uu____6099 = (

let uu____6106 = (FStar_TypeChecker_Env.effect_decl_opt g.FStar_Extraction_ML_UEnv.tcenv m)
in (FStar_Util.must uu____6106))
in (match (uu____6099) with
| (ed, qualifiers) -> begin
(

let uu____6133 = (

let uu____6134 = (FStar_All.pipe_right qualifiers (FStar_List.contains FStar_Syntax_Syntax.Reifiable))
in (FStar_All.pipe_right uu____6134 Prims.op_Negation))
in (match (uu____6133) with
| true -> begin
(term_as_mlexpr g t2)
end
| uu____6143 -> begin
(failwith "This should not happen (should have been handled at Tm_abs level)")
end))
end))
end
| uu____6150 -> begin
(term_as_mlexpr g t2)
end))
end
| FStar_Syntax_Syntax.Tm_meta (t1, uu____6152) -> begin
(term_as_mlexpr g t1)
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____6158) -> begin
(term_as_mlexpr g t1)
end
| FStar_Syntax_Syntax.Tm_constant (c) -> begin
(

let uu____6164 = (FStar_TypeChecker_TcTerm.type_of_tot_term g.FStar_Extraction_ML_UEnv.tcenv t)
in (match (uu____6164) with
| (uu____6177, ty, uu____6179) -> begin
(

let ml_ty = (term_as_mlty g ty)
in (

let uu____6181 = (

let uu____6182 = (FStar_Extraction_ML_Util.mlexpr_of_const t.FStar_Syntax_Syntax.pos c)
in (FStar_Extraction_ML_Syntax.with_ty ml_ty uu____6182))
in ((uu____6181), (FStar_Extraction_ML_Syntax.E_PURE), (ml_ty))))
end))
end
| FStar_Syntax_Syntax.Tm_name (uu____6183) -> begin
(

let uu____6184 = (is_type g t)
in (match (uu____6184) with
| true -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| uu____6191 -> begin
(

let uu____6192 = (FStar_Extraction_ML_UEnv.lookup_term g t)
in (match (uu____6192) with
| (FStar_Util.Inl (uu____6205), uu____6206) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| (FStar_Util.Inr (uu____6227, x, mltys, uu____6230), qual) -> begin
(match (mltys) with
| ([], t1) when (Prims.op_Equality t1 FStar_Extraction_ML_Syntax.ml_unit_ty) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (t1))
end
| ([], t1) -> begin
(

let uu____6256 = (maybe_eta_data_and_project_record g qual t1 x)
in ((uu____6256), (FStar_Extraction_ML_Syntax.E_PURE), (t1)))
end
| uu____6257 -> begin
(err_uninst g t mltys t)
end)
end))
end))
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(

let uu____6265 = (is_type g t)
in (match (uu____6265) with
| true -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| uu____6272 -> begin
(

let uu____6273 = (FStar_Extraction_ML_UEnv.try_lookup_fv g fv)
in (match (uu____6273) with
| FStar_Pervasives_Native.None -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.MLTY_Erased))
end
| FStar_Pervasives_Native.Some (FStar_Util.Inl (uu____6282)) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| FStar_Pervasives_Native.Some (FStar_Util.Inr (uu____6299, x, mltys, uu____6302)) -> begin
(match (mltys) with
| ([], t1) when (Prims.op_Equality t1 FStar_Extraction_ML_Syntax.ml_unit_ty) -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (t1))
end
| ([], t1) -> begin
(

let uu____6323 = (maybe_eta_data_and_project_record g fv.FStar_Syntax_Syntax.fv_qual t1 x)
in ((uu____6323), (FStar_Extraction_ML_Syntax.E_PURE), (t1)))
end
| uu____6324 -> begin
(err_uninst g t mltys t)
end)
end))
end))
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, copt) -> begin
(

let uu____6354 = (FStar_Syntax_Subst.open_term bs body)
in (match (uu____6354) with
| (bs1, body1) -> begin
(

let uu____6367 = (binders_as_ml_binders g bs1)
in (match (uu____6367) with
| (ml_bs, env) -> begin
(

let body2 = (match (copt) with
| FStar_Pervasives_Native.Some (c) -> begin
(

let uu____6400 = (FStar_TypeChecker_Env.is_reifiable env.FStar_Extraction_ML_UEnv.tcenv c)
in (match (uu____6400) with
| true -> begin
(FStar_TypeChecker_Util.reify_body env.FStar_Extraction_ML_UEnv.tcenv body1)
end
| uu____6401 -> begin
body1
end))
end
| FStar_Pervasives_Native.None -> begin
((FStar_Extraction_ML_UEnv.debug g (fun uu____6405 -> (

let uu____6406 = (FStar_Syntax_Print.term_to_string body1)
in (FStar_Util.print1 "No computation type for: %s\n" uu____6406))));
body1;
)
end)
in (

let uu____6407 = (term_as_mlexpr env body2)
in (match (uu____6407) with
| (ml_body, f, t1) -> begin
(

let uu____6423 = (FStar_List.fold_right (fun uu____6442 uu____6443 -> (match (((uu____6442), (uu____6443))) with
| ((uu____6464, targ), (f1, t2)) -> begin
((FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.MLTY_Fun (((targ), (f1), (t2)))))
end)) ml_bs ((f), (t1)))
in (match (uu____6423) with
| (f1, tfun) -> begin
(

let uu____6484 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty tfun) (FStar_Extraction_ML_Syntax.MLE_Fun (((ml_bs), (ml_body)))))
in ((uu____6484), (f1), (tfun)))
end))
end)))
end))
end))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range_of); FStar_Syntax_Syntax.pos = uu____6491; FStar_Syntax_Syntax.vars = uu____6492}, ((a1, uu____6494))::[]) -> begin
(

let ty = (

let uu____6524 = (FStar_Syntax_Syntax.tabbrev FStar_Parser_Const.range_lid)
in (term_as_mlty g uu____6524))
in (

let uu____6525 = (

let uu____6526 = (FStar_Extraction_ML_Util.mlexpr_of_range a1.FStar_Syntax_Syntax.pos)
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty ty) uu____6526))
in ((uu____6525), (FStar_Extraction_ML_Syntax.E_PURE), (ty))))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_set_range_of); FStar_Syntax_Syntax.pos = uu____6527; FStar_Syntax_Syntax.vars = uu____6528}, ((t1, uu____6530))::((r, uu____6532))::[]) -> begin
(term_as_mlexpr g t1)
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reflect (uu____6571)); FStar_Syntax_Syntax.pos = uu____6572; FStar_Syntax_Syntax.vars = uu____6573}, uu____6574) -> begin
(failwith "Unreachable? Tm_app Const_reflect")
end
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let is_total = (fun rc -> ((FStar_Ident.lid_equals rc.FStar_Syntax_Syntax.residual_effect FStar_Parser_Const.effect_Tot_lid) || (FStar_All.pipe_right rc.FStar_Syntax_Syntax.residual_flags (FStar_List.existsb (fun uu___63_6632 -> (match (uu___63_6632) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| uu____6633 -> begin
false
end))))))
in (

let uu____6634 = (

let uu____6639 = (

let uu____6640 = (FStar_Syntax_Subst.compress head1)
in uu____6640.FStar_Syntax_Syntax.n)
in ((head1.FStar_Syntax_Syntax.n), (uu____6639)))
in (match (uu____6634) with
| (FStar_Syntax_Syntax.Tm_uvar (uu____6649), uu____6650) -> begin
(

let t1 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Iota)::(FStar_TypeChecker_Normalize.Zeta)::(FStar_TypeChecker_Normalize.EraseUniverses)::(FStar_TypeChecker_Normalize.AllowUnboundUniverses)::[]) g.FStar_Extraction_ML_UEnv.tcenv t)
in (term_as_mlexpr g t1))
end
| (uu____6652, FStar_Syntax_Syntax.Tm_abs (bs, uu____6654, FStar_Pervasives_Native.Some (rc))) when (is_total rc) -> begin
(

let t1 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Iota)::(FStar_TypeChecker_Normalize.Zeta)::(FStar_TypeChecker_Normalize.EraseUniverses)::(FStar_TypeChecker_Normalize.AllowUnboundUniverses)::[]) g.FStar_Extraction_ML_UEnv.tcenv t)
in (term_as_mlexpr g t1))
end
| (uu____6675, FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify)) -> begin
(

let e = (

let uu____6677 = (FStar_List.hd args)
in (FStar_TypeChecker_Util.reify_body_with_arg g.FStar_Extraction_ML_UEnv.tcenv head1 uu____6677))
in (

let tm = (

let uu____6687 = (

let uu____6692 = (FStar_TypeChecker_Util.remove_reify e)
in (

let uu____6693 = (FStar_List.tl args)
in (FStar_Syntax_Syntax.mk_Tm_app uu____6692 uu____6693)))
in (uu____6687 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))
in (term_as_mlexpr g tm)))
end
| uu____6702 -> begin
(

let rec extract_app = (fun is_data uu____6755 uu____6756 restArgs -> (match (((uu____6755), (uu____6756))) with
| ((mlhead, mlargs_f), (f, t1)) -> begin
(match (((restArgs), (t1))) with
| ([], uu____6846) -> begin
(

let mlargs = (FStar_All.pipe_right (FStar_List.rev mlargs_f) (FStar_List.map FStar_Pervasives_Native.fst))
in (

let app = (

let uu____6881 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t1) (FStar_Extraction_ML_Syntax.MLE_App (((mlhead), (mlargs)))))
in (FStar_All.pipe_left (maybe_eta_data_and_project_record g is_data t1) uu____6881))
in ((app), (f), (t1))))
end
| (((arg, uu____6885))::rest, FStar_Extraction_ML_Syntax.MLTY_Fun (formal_t, f', t2)) when ((is_type g arg) && (type_leq g formal_t FStar_Extraction_ML_Syntax.ml_unit_ty)) -> begin
(

let uu____6916 = (

let uu____6921 = (FStar_Extraction_ML_Util.join arg.FStar_Syntax_Syntax.pos f f')
in ((uu____6921), (t2)))
in (extract_app is_data ((mlhead), ((((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE)))::mlargs_f)) uu____6916 rest))
end
| (((e0, uu____6933))::rest, FStar_Extraction_ML_Syntax.MLTY_Fun (tExpected, f', t2)) -> begin
(

let r = e0.FStar_Syntax_Syntax.pos
in (

let expected_effect = (

let uu____6966 = ((FStar_Options.lax ()) && (FStar_TypeChecker_Util.short_circuit_head head1))
in (match (uu____6966) with
| true -> begin
FStar_Extraction_ML_Syntax.E_IMPURE
end
| uu____6967 -> begin
FStar_Extraction_ML_Syntax.E_PURE
end))
in (

let uu____6968 = (check_term_as_mlexpr g e0 expected_effect tExpected)
in (match (uu____6968) with
| (e01, tInferred) -> begin
(

let uu____6981 = (

let uu____6986 = (FStar_Extraction_ML_Util.join_l r ((f)::(f')::[]))
in ((uu____6986), (t2)))
in (extract_app is_data ((mlhead), ((((e01), (expected_effect)))::mlargs_f)) uu____6981 rest))
end))))
end
| uu____6997 -> begin
(

let uu____7010 = (FStar_Extraction_ML_Util.udelta_unfold g t1)
in (match (uu____7010) with
| FStar_Pervasives_Native.Some (t2) -> begin
(extract_app is_data ((mlhead), (mlargs_f)) ((f), (t2)) restArgs)
end
| FStar_Pervasives_Native.None -> begin
(match (t1) with
| FStar_Extraction_ML_Syntax.MLTY_Erased -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (t1))
end
| uu____7032 -> begin
(err_ill_typed_application g top restArgs t1)
end)
end))
end)
end))
in (

let extract_app_maybe_projector = (fun is_data mlhead uu____7082 args1 -> (match (uu____7082) with
| (f, t1) -> begin
(match (is_data) with
| FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_projector (uu____7114)) -> begin
(

let rec remove_implicits = (fun args2 f1 t2 -> (match (((args2), (t2))) with
| (((a0, FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Implicit (uu____7198))))::args3, FStar_Extraction_ML_Syntax.MLTY_Fun (uu____7200, f', t3)) -> begin
(

let uu____7237 = (FStar_Extraction_ML_Util.join a0.FStar_Syntax_Syntax.pos f1 f')
in (remove_implicits args3 uu____7237 t3))
end
| uu____7238 -> begin
((args2), (f1), (t2))
end))
in (

let uu____7263 = (remove_implicits args1 f t1)
in (match (uu____7263) with
| (args2, f1, t2) -> begin
(extract_app is_data ((mlhead), ([])) ((f1), (t2)) args2)
end)))
end
| uu____7319 -> begin
(extract_app is_data ((mlhead), ([])) ((f), (t1)) args1)
end)
end))
in (

let extract_app_with_instantiations = (fun uu____7343 -> (

let head2 = (FStar_Syntax_Util.un_uinst head1)
in (match (head2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_name (uu____7351) -> begin
(

let uu____7352 = (

let uu____7371 = (FStar_Extraction_ML_UEnv.lookup_term g head2)
in (match (uu____7371) with
| (FStar_Util.Inr (uu____7396, x1, x2, x3), q) -> begin
((((x1), (x2), (x3))), (q))
end
| uu____7425 -> begin
(failwith "FIXME Ty")
end))
in (match (uu____7352) with
| ((head_ml, (vars, t1), inst_ok), qual) -> begin
(

let has_typ_apps = (match (args) with
| ((a, uu____7489))::uu____7490 -> begin
(is_type g a)
end
| uu____7509 -> begin
false
end)
in (

let uu____7518 = (match (vars) with
| (uu____7551)::uu____7552 when ((not (has_typ_apps)) && inst_ok) -> begin
((head_ml), (t1), (args))
end
| uu____7563 -> begin
(

let n1 = (FStar_List.length vars)
in (match ((n1 <= (FStar_List.length args))) with
| true -> begin
(

let uu____7595 = (FStar_Util.first_N n1 args)
in (match (uu____7595) with
| (prefix1, rest) -> begin
(

let prefixAsMLTypes = (FStar_List.map (fun uu____7686 -> (match (uu____7686) with
| (x, uu____7692) -> begin
(term_as_mlty g x)
end)) prefix1)
in (

let t2 = (instantiate ((vars), (t1)) prefixAsMLTypes)
in (

let mk_tapp = (fun e ty_args -> (match (ty_args) with
| [] -> begin
e
end
| uu____7709 -> begin
(

let uu___67_7712 = e
in {FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_TApp (((e), (ty_args))); FStar_Extraction_ML_Syntax.mlty = uu___67_7712.FStar_Extraction_ML_Syntax.mlty; FStar_Extraction_ML_Syntax.loc = uu___67_7712.FStar_Extraction_ML_Syntax.loc})
end))
in (

let head3 = (match (head_ml.FStar_Extraction_ML_Syntax.expr) with
| FStar_Extraction_ML_Syntax.MLE_Name (uu____7716) -> begin
(

let uu___68_7717 = (mk_tapp head_ml prefixAsMLTypes)
in {FStar_Extraction_ML_Syntax.expr = uu___68_7717.FStar_Extraction_ML_Syntax.expr; FStar_Extraction_ML_Syntax.mlty = t2; FStar_Extraction_ML_Syntax.loc = uu___68_7717.FStar_Extraction_ML_Syntax.loc})
end
| FStar_Extraction_ML_Syntax.MLE_Var (uu____7718) -> begin
(

let uu___68_7719 = (mk_tapp head_ml prefixAsMLTypes)
in {FStar_Extraction_ML_Syntax.expr = uu___68_7719.FStar_Extraction_ML_Syntax.expr; FStar_Extraction_ML_Syntax.mlty = t2; FStar_Extraction_ML_Syntax.loc = uu___68_7719.FStar_Extraction_ML_Syntax.loc})
end
| FStar_Extraction_ML_Syntax.MLE_App (head3, ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Const (FStar_Extraction_ML_Syntax.MLC_Unit); FStar_Extraction_ML_Syntax.mlty = uu____7721; FStar_Extraction_ML_Syntax.loc = uu____7722})::[]) -> begin
(FStar_All.pipe_right (FStar_Extraction_ML_Syntax.MLE_App ((((

let uu___69_7728 = (mk_tapp head3 prefixAsMLTypes)
in {FStar_Extraction_ML_Syntax.expr = uu___69_7728.FStar_Extraction_ML_Syntax.expr; FStar_Extraction_ML_Syntax.mlty = FStar_Extraction_ML_Syntax.MLTY_Fun (((FStar_Extraction_ML_Syntax.ml_unit_ty), (FStar_Extraction_ML_Syntax.E_PURE), (t2))); FStar_Extraction_ML_Syntax.loc = uu___69_7728.FStar_Extraction_ML_Syntax.loc})), ((FStar_Extraction_ML_Syntax.ml_unit)::[])))) (FStar_Extraction_ML_Syntax.with_ty t2))
end
| uu____7729 -> begin
(failwith "Impossible: Unexpected head term")
end)
in ((head3), (t2), (rest))))))
end))
end
| uu____7738 -> begin
(err_uninst g head2 ((vars), (t1)) top)
end))
end)
in (match (uu____7518) with
| (head_ml1, head_t, args1) -> begin
(match (args1) with
| [] -> begin
(

let uu____7800 = (maybe_eta_data_and_project_record g qual head_t head_ml1)
in ((uu____7800), (FStar_Extraction_ML_Syntax.E_PURE), (head_t)))
end
| uu____7801 -> begin
(extract_app_maybe_projector qual head_ml1 ((FStar_Extraction_ML_Syntax.E_PURE), (head_t)) args1)
end)
end)))
end))
end
| FStar_Syntax_Syntax.Tm_fvar (uu____7812) -> begin
(

let uu____7813 = (

let uu____7832 = (FStar_Extraction_ML_UEnv.lookup_term g head2)
in (match (uu____7832) with
| (FStar_Util.Inr (uu____7857, x1, x2, x3), q) -> begin
((((x1), (x2), (x3))), (q))
end
| uu____7886 -> begin
(failwith "FIXME Ty")
end))
in (match (uu____7813) with
| ((head_ml, (vars, t1), inst_ok), qual) -> begin
(

let has_typ_apps = (match (args) with
| ((a, uu____7950))::uu____7951 -> begin
(is_type g a)
end
| uu____7970 -> begin
false
end)
in (

let uu____7979 = (match (vars) with
| (uu____8012)::uu____8013 when ((not (has_typ_apps)) && inst_ok) -> begin
((head_ml), (t1), (args))
end
| uu____8024 -> begin
(

let n1 = (FStar_List.length vars)
in (match ((n1 <= (FStar_List.length args))) with
| true -> begin
(

let uu____8056 = (FStar_Util.first_N n1 args)
in (match (uu____8056) with
| (prefix1, rest) -> begin
(

let prefixAsMLTypes = (FStar_List.map (fun uu____8147 -> (match (uu____8147) with
| (x, uu____8153) -> begin
(term_as_mlty g x)
end)) prefix1)
in (

let t2 = (instantiate ((vars), (t1)) prefixAsMLTypes)
in (

let mk_tapp = (fun e ty_args -> (match (ty_args) with
| [] -> begin
e
end
| uu____8170 -> begin
(

let uu___67_8173 = e
in {FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_TApp (((e), (ty_args))); FStar_Extraction_ML_Syntax.mlty = uu___67_8173.FStar_Extraction_ML_Syntax.mlty; FStar_Extraction_ML_Syntax.loc = uu___67_8173.FStar_Extraction_ML_Syntax.loc})
end))
in (

let head3 = (match (head_ml.FStar_Extraction_ML_Syntax.expr) with
| FStar_Extraction_ML_Syntax.MLE_Name (uu____8177) -> begin
(

let uu___68_8178 = (mk_tapp head_ml prefixAsMLTypes)
in {FStar_Extraction_ML_Syntax.expr = uu___68_8178.FStar_Extraction_ML_Syntax.expr; FStar_Extraction_ML_Syntax.mlty = t2; FStar_Extraction_ML_Syntax.loc = uu___68_8178.FStar_Extraction_ML_Syntax.loc})
end
| FStar_Extraction_ML_Syntax.MLE_Var (uu____8179) -> begin
(

let uu___68_8180 = (mk_tapp head_ml prefixAsMLTypes)
in {FStar_Extraction_ML_Syntax.expr = uu___68_8180.FStar_Extraction_ML_Syntax.expr; FStar_Extraction_ML_Syntax.mlty = t2; FStar_Extraction_ML_Syntax.loc = uu___68_8180.FStar_Extraction_ML_Syntax.loc})
end
| FStar_Extraction_ML_Syntax.MLE_App (head3, ({FStar_Extraction_ML_Syntax.expr = FStar_Extraction_ML_Syntax.MLE_Const (FStar_Extraction_ML_Syntax.MLC_Unit); FStar_Extraction_ML_Syntax.mlty = uu____8182; FStar_Extraction_ML_Syntax.loc = uu____8183})::[]) -> begin
(FStar_All.pipe_right (FStar_Extraction_ML_Syntax.MLE_App ((((

let uu___69_8189 = (mk_tapp head3 prefixAsMLTypes)
in {FStar_Extraction_ML_Syntax.expr = uu___69_8189.FStar_Extraction_ML_Syntax.expr; FStar_Extraction_ML_Syntax.mlty = FStar_Extraction_ML_Syntax.MLTY_Fun (((FStar_Extraction_ML_Syntax.ml_unit_ty), (FStar_Extraction_ML_Syntax.E_PURE), (t2))); FStar_Extraction_ML_Syntax.loc = uu___69_8189.FStar_Extraction_ML_Syntax.loc})), ((FStar_Extraction_ML_Syntax.ml_unit)::[])))) (FStar_Extraction_ML_Syntax.with_ty t2))
end
| uu____8190 -> begin
(failwith "Impossible: Unexpected head term")
end)
in ((head3), (t2), (rest))))))
end))
end
| uu____8199 -> begin
(err_uninst g head2 ((vars), (t1)) top)
end))
end)
in (match (uu____7979) with
| (head_ml1, head_t, args1) -> begin
(match (args1) with
| [] -> begin
(

let uu____8261 = (maybe_eta_data_and_project_record g qual head_t head_ml1)
in ((uu____8261), (FStar_Extraction_ML_Syntax.E_PURE), (head_t)))
end
| uu____8262 -> begin
(extract_app_maybe_projector qual head_ml1 ((FStar_Extraction_ML_Syntax.E_PURE), (head_t)) args1)
end)
end)))
end))
end
| uu____8273 -> begin
(

let uu____8274 = (term_as_mlexpr g head2)
in (match (uu____8274) with
| (head3, f, t1) -> begin
(extract_app_maybe_projector FStar_Pervasives_Native.None head3 ((f), (t1)) args)
end))
end)))
in (

let uu____8290 = (is_type g t)
in (match (uu____8290) with
| true -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| uu____8297 -> begin
(

let uu____8298 = (

let uu____8299 = (FStar_Syntax_Util.un_uinst head1)
in uu____8299.FStar_Syntax_Syntax.n)
in (match (uu____8298) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(

let uu____8309 = (FStar_Extraction_ML_UEnv.try_lookup_fv g fv)
in (match (uu____8309) with
| FStar_Pervasives_Native.None -> begin
((FStar_Extraction_ML_Syntax.ml_unit), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.MLTY_Erased))
end
| uu____8318 -> begin
(extract_app_with_instantiations ())
end))
end
| uu____8321 -> begin
(extract_app_with_instantiations ())
end))
end)))))
end)))
end
| FStar_Syntax_Syntax.Tm_ascribed (e0, (tc, uu____8324), f) -> begin
(

let t1 = (match (tc) with
| FStar_Util.Inl (t1) -> begin
(term_as_mlty g t1)
end
| FStar_Util.Inr (c) -> begin
(term_as_mlty g (FStar_Syntax_Util.comp_result c))
end)
in (

let f1 = (match (f) with
| FStar_Pervasives_Native.None -> begin
(failwith "Ascription node with an empty effect label")
end
| FStar_Pervasives_Native.Some (l) -> begin
(effect_as_etag g l)
end)
in (

let uu____8391 = (check_term_as_mlexpr g e0 f1 t1)
in (match (uu____8391) with
| (e, t2) -> begin
((e), (f1), (t2))
end))))
end
| FStar_Syntax_Syntax.Tm_let ((is_rec, lbs), e') -> begin
(

let top_level = (FStar_Syntax_Syntax.is_top_level lbs)
in (

let uu____8422 = (match (is_rec) with
| true -> begin
(FStar_Syntax_Subst.open_let_rec lbs e')
end
| uu____8439 -> begin
(

let uu____8440 = (FStar_Syntax_Syntax.is_top_level lbs)
in (match (uu____8440) with
| true -> begin
((lbs), (e'))
end
| uu____8453 -> begin
(

let lb = (FStar_List.hd lbs)
in (

let x = (

let uu____8456 = (FStar_Util.left lb.FStar_Syntax_Syntax.lbname)
in (FStar_Syntax_Syntax.freshen_bv uu____8456))
in (

let lb1 = (

let uu___70_8458 = lb
in {FStar_Syntax_Syntax.lbname = FStar_Util.Inl (x); FStar_Syntax_Syntax.lbunivs = uu___70_8458.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = uu___70_8458.FStar_Syntax_Syntax.lbtyp; FStar_Syntax_Syntax.lbeff = uu___70_8458.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = uu___70_8458.FStar_Syntax_Syntax.lbdef; FStar_Syntax_Syntax.lbattrs = uu___70_8458.FStar_Syntax_Syntax.lbattrs; FStar_Syntax_Syntax.lbpos = uu___70_8458.FStar_Syntax_Syntax.lbpos})
in (

let e'1 = (FStar_Syntax_Subst.subst ((FStar_Syntax_Syntax.DB ((((Prims.parse_int "0")), (x))))::[]) e')
in (((lb1)::[]), (e'1))))))
end))
end)
in (match (uu____8422) with
| (lbs1, e'1) -> begin
(

let lbs2 = (match (top_level) with
| true -> begin
(FStar_All.pipe_right lbs1 (FStar_List.map (fun lb -> (

let tcenv = (

let uu____8493 = (FStar_Ident.lid_of_path (FStar_List.append (FStar_Pervasives_Native.fst g.FStar_Extraction_ML_UEnv.currentModule) (((FStar_Pervasives_Native.snd g.FStar_Extraction_ML_UEnv.currentModule))::[])) FStar_Range.dummyRange)
in (FStar_TypeChecker_Env.set_current_module g.FStar_Extraction_ML_UEnv.tcenv uu____8493))
in (

let lbdef = (

let uu____8501 = (FStar_Options.ml_ish ())
in (match (uu____8501) with
| true -> begin
lb.FStar_Syntax_Syntax.lbdef
end
| uu____8504 -> begin
(FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.AllowUnboundUniverses)::(FStar_TypeChecker_Normalize.EraseUniverses)::(FStar_TypeChecker_Normalize.Inlining)::(FStar_TypeChecker_Normalize.Eager_unfolding)::(FStar_TypeChecker_Normalize.Exclude (FStar_TypeChecker_Normalize.Zeta))::(FStar_TypeChecker_Normalize.PureSubtermsWithinComputations)::(FStar_TypeChecker_Normalize.Primops)::[]) tcenv lb.FStar_Syntax_Syntax.lbdef)
end))
in (

let uu___71_8505 = lb
in {FStar_Syntax_Syntax.lbname = uu___71_8505.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = uu___71_8505.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = uu___71_8505.FStar_Syntax_Syntax.lbtyp; FStar_Syntax_Syntax.lbeff = uu___71_8505.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = lbdef; FStar_Syntax_Syntax.lbattrs = uu___71_8505.FStar_Syntax_Syntax.lbattrs; FStar_Syntax_Syntax.lbpos = uu___71_8505.FStar_Syntax_Syntax.lbpos}))))))
end
| uu____8506 -> begin
lbs1
end)
in (

let maybe_generalize = (fun uu____8512 -> (match (uu____8512) with
| {FStar_Syntax_Syntax.lbname = lbname_; FStar_Syntax_Syntax.lbunivs = uu____8514; FStar_Syntax_Syntax.lbtyp = t1; FStar_Syntax_Syntax.lbeff = lbeff; FStar_Syntax_Syntax.lbdef = e; FStar_Syntax_Syntax.lbattrs = uu____8518; FStar_Syntax_Syntax.lbpos = uu____8519} -> begin
(

let f_e = (effect_as_etag g lbeff)
in (

let t2 = (FStar_Syntax_Subst.compress t1)
in (

let no_gen = (fun uu____8577 -> (

let expected_t = (term_as_mlty g t2)
in ((lbname_), (f_e), (((t2), ((([]), ((([]), (expected_t))))))), (false), (e))))
in (

let uu____8639 = (FStar_TypeChecker_Util.must_erase_for_extraction g.FStar_Extraction_ML_UEnv.tcenv t2)
in (match (uu____8639) with
| true -> begin
((lbname_), (f_e), (((t2), ((([]), ((([]), (FStar_Extraction_ML_Syntax.MLTY_Erased))))))), (false), (e))
end
| uu____8682 -> begin
(match (t2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) when (

let uu____8701 = (FStar_List.hd bs)
in (FStar_All.pipe_right uu____8701 (is_type_binder g))) -> begin
(

let uu____8714 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____8714) with
| (bs1, c1) -> begin
(

let uu____8721 = (

let uu____8732 = (FStar_Util.prefix_until (fun x -> (

let uu____8768 = (is_type_binder g x)
in (not (uu____8768)))) bs1)
in (match (uu____8732) with
| FStar_Pervasives_Native.None -> begin
((bs1), ((FStar_Syntax_Util.comp_result c1)))
end
| FStar_Pervasives_Native.Some (bs2, b, rest) -> begin
(

let uu____8860 = (FStar_Syntax_Util.arrow ((b)::rest) c1)
in ((bs2), (uu____8860)))
end))
in (match (uu____8721) with
| (tbinders, tbody) -> begin
(

let n_tbinders = (FStar_List.length tbinders)
in (

let e1 = (

let uu____8897 = (normalize_abs e)
in (FStar_All.pipe_right uu____8897 FStar_Syntax_Util.unmeta))
in (match (e1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_abs (bs2, body, copt) -> begin
(

let uu____8923 = (FStar_Syntax_Subst.open_term bs2 body)
in (match (uu____8923) with
| (bs3, body1) -> begin
(match ((n_tbinders <= (FStar_List.length bs3))) with
| true -> begin
(

let uu____8940 = (FStar_Util.first_N n_tbinders bs3)
in (match (uu____8940) with
| (targs, rest_args) -> begin
(

let expected_source_ty = (

let s = (FStar_List.map2 (fun uu____9010 uu____9011 -> (match (((uu____9010), (uu____9011))) with
| ((x, uu____9029), (y, uu____9031)) -> begin
(

let uu____9040 = (

let uu____9047 = (FStar_Syntax_Syntax.bv_to_name y)
in ((x), (uu____9047)))
in FStar_Syntax_Syntax.NT (uu____9040))
end)) tbinders targs)
in (FStar_Syntax_Subst.subst s tbody))
in (

let env = (FStar_List.fold_left (fun env uu____9062 -> (match (uu____9062) with
| (a, uu____9068) -> begin
(FStar_Extraction_ML_UEnv.extend_ty env a FStar_Pervasives_Native.None)
end)) g targs)
in (

let expected_t = (term_as_mlty env expected_source_ty)
in (

let polytype = (

let uu____9075 = (FStar_All.pipe_right targs (FStar_List.map (fun uu____9089 -> (match (uu____9089) with
| (x, uu____9095) -> begin
(FStar_Extraction_ML_UEnv.bv_as_ml_tyvar x)
end))))
in ((uu____9075), (expected_t)))
in (

let add_unit = (match (rest_args) with
| [] -> begin
((

let uu____9103 = (is_fstar_value body1)
in (not (uu____9103))) || (

let uu____9105 = (FStar_Syntax_Util.is_pure_comp c1)
in (not (uu____9105))))
end
| uu____9106 -> begin
false
end)
in (

let rest_args1 = (match (add_unit) with
| true -> begin
(unit_binder)::rest_args
end
| uu____9118 -> begin
rest_args
end)
in (

let polytype1 = (match (add_unit) with
| true -> begin
(FStar_Extraction_ML_Syntax.push_unit polytype)
end
| uu____9120 -> begin
polytype
end)
in (

let body2 = (FStar_Syntax_Util.abs rest_args1 body1 copt)
in ((lbname_), (f_e), (((t2), (((targs), (polytype1))))), (add_unit), (body2))))))))))
end))
end
| uu____9148 -> begin
(failwith "Not enough type binders")
end)
end))
end
| FStar_Syntax_Syntax.Tm_uinst (uu____9149) -> begin
(

let env = (FStar_List.fold_left (fun env uu____9166 -> (match (uu____9166) with
| (a, uu____9172) -> begin
(FStar_Extraction_ML_UEnv.extend_ty env a FStar_Pervasives_Native.None)
end)) g tbinders)
in (

let expected_t = (term_as_mlty env tbody)
in (

let polytype = (

let uu____9181 = (FStar_All.pipe_right tbinders (FStar_List.map (fun uu____9199 -> (match (uu____9199) with
| (x, uu____9205) -> begin
(FStar_Extraction_ML_UEnv.bv_as_ml_tyvar x)
end))))
in ((uu____9181), (expected_t)))
in (

let args = (FStar_All.pipe_right tbinders (FStar_List.map (fun uu____9239 -> (match (uu____9239) with
| (bv, uu____9245) -> begin
(

let uu____9246 = (FStar_Syntax_Syntax.bv_to_name bv)
in (FStar_All.pipe_right uu____9246 FStar_Syntax_Syntax.as_arg))
end))))
in (

let e2 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((e1), (args)))) FStar_Pervasives_Native.None e1.FStar_Syntax_Syntax.pos)
in ((lbname_), (f_e), (((t2), (((tbinders), (polytype))))), (false), (e2)))))))
end
| FStar_Syntax_Syntax.Tm_fvar (uu____9296) -> begin
(

let env = (FStar_List.fold_left (fun env uu____9307 -> (match (uu____9307) with
| (a, uu____9313) -> begin
(FStar_Extraction_ML_UEnv.extend_ty env a FStar_Pervasives_Native.None)
end)) g tbinders)
in (

let expected_t = (term_as_mlty env tbody)
in (

let polytype = (

let uu____9322 = (FStar_All.pipe_right tbinders (FStar_List.map (fun uu____9340 -> (match (uu____9340) with
| (x, uu____9346) -> begin
(FStar_Extraction_ML_UEnv.bv_as_ml_tyvar x)
end))))
in ((uu____9322), (expected_t)))
in (

let args = (FStar_All.pipe_right tbinders (FStar_List.map (fun uu____9380 -> (match (uu____9380) with
| (bv, uu____9386) -> begin
(

let uu____9387 = (FStar_Syntax_Syntax.bv_to_name bv)
in (FStar_All.pipe_right uu____9387 FStar_Syntax_Syntax.as_arg))
end))))
in (

let e2 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((e1), (args)))) FStar_Pervasives_Native.None e1.FStar_Syntax_Syntax.pos)
in ((lbname_), (f_e), (((t2), (((tbinders), (polytype))))), (false), (e2)))))))
end
| FStar_Syntax_Syntax.Tm_name (uu____9437) -> begin
(

let env = (FStar_List.fold_left (fun env uu____9448 -> (match (uu____9448) with
| (a, uu____9454) -> begin
(FStar_Extraction_ML_UEnv.extend_ty env a FStar_Pervasives_Native.None)
end)) g tbinders)
in (

let expected_t = (term_as_mlty env tbody)
in (

let polytype = (

let uu____9463 = (FStar_All.pipe_right tbinders (FStar_List.map (fun uu____9481 -> (match (uu____9481) with
| (x, uu____9487) -> begin
(FStar_Extraction_ML_UEnv.bv_as_ml_tyvar x)
end))))
in ((uu____9463), (expected_t)))
in (

let args = (FStar_All.pipe_right tbinders (FStar_List.map (fun uu____9521 -> (match (uu____9521) with
| (bv, uu____9527) -> begin
(

let uu____9528 = (FStar_Syntax_Syntax.bv_to_name bv)
in (FStar_All.pipe_right uu____9528 FStar_Syntax_Syntax.as_arg))
end))))
in (

let e2 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((e1), (args)))) FStar_Pervasives_Native.None e1.FStar_Syntax_Syntax.pos)
in ((lbname_), (f_e), (((t2), (((tbinders), (polytype))))), (false), (e2)))))))
end
| uu____9578 -> begin
(err_value_restriction e1)
end)))
end))
end))
end
| uu____9579 -> begin
(no_gen ())
end)
end)))))
end))
in (

let check_lb = (fun env uu____9598 -> (match (uu____9598) with
| (nm, (_lbname, f, (_t, (targs, polytype)), add_unit, e)) -> begin
(

let env1 = (FStar_List.fold_left (fun env1 uu____9637 -> (match (uu____9637) with
| (a, uu____9643) -> begin
(FStar_Extraction_ML_UEnv.extend_ty env1 a FStar_Pervasives_Native.None)
end)) env targs)
in (

let expected_t = (FStar_Pervasives_Native.snd polytype)
in (

let uu____9645 = (check_term_as_mlexpr env1 e f expected_t)
in (match (uu____9645) with
| (e1, ty) -> begin
(

let uu____9656 = (maybe_promote_effect e1 f expected_t)
in (match (uu____9656) with
| (e2, f1) -> begin
(

let meta = (match (((f1), (ty))) with
| (FStar_Extraction_ML_Syntax.E_PURE, FStar_Extraction_ML_Syntax.MLTY_Erased) -> begin
(FStar_Extraction_ML_Syntax.Erased)::[]
end
| (FStar_Extraction_ML_Syntax.E_GHOST, FStar_Extraction_ML_Syntax.MLTY_Erased) -> begin
(FStar_Extraction_ML_Syntax.Erased)::[]
end
| uu____9668 -> begin
[]
end)
in ((f1), ({FStar_Extraction_ML_Syntax.mllb_name = nm; FStar_Extraction_ML_Syntax.mllb_tysc = FStar_Pervasives_Native.Some (polytype); FStar_Extraction_ML_Syntax.mllb_add_unit = add_unit; FStar_Extraction_ML_Syntax.mllb_def = e2; FStar_Extraction_ML_Syntax.mllb_meta = meta; FStar_Extraction_ML_Syntax.print_typ = true})))
end))
end))))
end))
in (

let lbs3 = (FStar_All.pipe_right lbs2 (FStar_List.map maybe_generalize))
in (

let uu____9716 = (FStar_List.fold_right (fun lb uu____9807 -> (match (uu____9807) with
| (env, lbs4) -> begin
(

let uu____9932 = lb
in (match (uu____9932) with
| (lbname, uu____9980, (t1, (uu____9982, polytype)), add_unit, uu____9985) -> begin
(

let uu____9998 = (FStar_Extraction_ML_UEnv.extend_lb env lbname t1 polytype add_unit true)
in (match (uu____9998) with
| (env1, nm) -> begin
((env1), ((((nm), (lb)))::lbs4))
end))
end))
end)) lbs3 ((g), ([])))
in (match (uu____9716) with
| (env_body, lbs4) -> begin
(

let env_def = (match (is_rec) with
| true -> begin
env_body
end
| uu____10200 -> begin
g
end)
in (

let lbs5 = (FStar_All.pipe_right lbs4 (FStar_List.map (check_lb env_def)))
in (

let e'_rng = e'1.FStar_Syntax_Syntax.pos
in (

let uu____10229 = (term_as_mlexpr env_body e'1)
in (match (uu____10229) with
| (e'2, f', t') -> begin
(

let f = (

let uu____10246 = (

let uu____10249 = (FStar_List.map FStar_Pervasives_Native.fst lbs5)
in (f')::uu____10249)
in (FStar_Extraction_ML_Util.join_l e'_rng uu____10246))
in (

let is_rec1 = (match ((Prims.op_Equality is_rec true)) with
| true -> begin
FStar_Extraction_ML_Syntax.Rec
end
| uu____10257 -> begin
FStar_Extraction_ML_Syntax.NonRec
end)
in (

let uu____10258 = (

let uu____10259 = (

let uu____10260 = (

let uu____10261 = (FStar_List.map FStar_Pervasives_Native.snd lbs5)
in ((is_rec1), (uu____10261)))
in (mk_MLE_Let top_level uu____10260 e'2))
in (

let uu____10270 = (FStar_Extraction_ML_Util.mlloc_of_range t.FStar_Syntax_Syntax.pos)
in (FStar_Extraction_ML_Syntax.with_ty_loc t' uu____10259 uu____10270)))
in ((uu____10258), (f), (t')))))
end)))))
end))))))
end)))
end
| FStar_Syntax_Syntax.Tm_match (scrutinee, pats) -> begin
(

let uu____10309 = (term_as_mlexpr g scrutinee)
in (match (uu____10309) with
| (e, f_e, t_e) -> begin
(

let uu____10325 = (check_pats_for_ite pats)
in (match (uu____10325) with
| (b, then_e, else_e) -> begin
(

let no_lift = (fun x t1 -> x)
in (match (b) with
| true -> begin
(match (((then_e), (else_e))) with
| (FStar_Pervasives_Native.Some (then_e1), FStar_Pervasives_Native.Some (else_e1)) -> begin
(

let uu____10386 = (term_as_mlexpr g then_e1)
in (match (uu____10386) with
| (then_mle, f_then, t_then) -> begin
(

let uu____10402 = (term_as_mlexpr g else_e1)
in (match (uu____10402) with
| (else_mle, f_else, t_else) -> begin
(

let uu____10418 = (

let uu____10429 = (type_leq g t_then t_else)
in (match (uu____10429) with
| true -> begin
((t_else), (no_lift))
end
| uu____10446 -> begin
(

let uu____10447 = (type_leq g t_else t_then)
in (match (uu____10447) with
| true -> begin
((t_then), (no_lift))
end
| uu____10464 -> begin
((FStar_Extraction_ML_Syntax.MLTY_Top), (FStar_Extraction_ML_Syntax.apply_obj_repr))
end))
end))
in (match (uu____10418) with
| (t_branch, maybe_lift1) -> begin
(

let uu____10491 = (

let uu____10492 = (

let uu____10493 = (

let uu____10502 = (maybe_lift1 then_mle t_then)
in (

let uu____10503 = (

let uu____10506 = (maybe_lift1 else_mle t_else)
in FStar_Pervasives_Native.Some (uu____10506))
in ((e), (uu____10502), (uu____10503))))
in FStar_Extraction_ML_Syntax.MLE_If (uu____10493))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t_branch) uu____10492))
in (

let uu____10509 = (FStar_Extraction_ML_Util.join then_e1.FStar_Syntax_Syntax.pos f_then f_else)
in ((uu____10491), (uu____10509), (t_branch))))
end))
end))
end))
end
| uu____10510 -> begin
(failwith "ITE pats matched but then and else expressions not found?")
end)
end
| uu____10525 -> begin
(

let uu____10526 = (FStar_All.pipe_right pats (FStar_Util.fold_map (fun compat br -> (

let uu____10621 = (FStar_Syntax_Subst.open_branch br)
in (match (uu____10621) with
| (pat, when_opt, branch1) -> begin
(

let uu____10665 = (extract_pat g pat t_e term_as_mlexpr)
in (match (uu____10665) with
| (env, p, pat_t_compat) -> begin
(

let uu____10723 = (match (when_opt) with
| FStar_Pervasives_Native.None -> begin
((FStar_Pervasives_Native.None), (FStar_Extraction_ML_Syntax.E_PURE))
end
| FStar_Pervasives_Native.Some (w) -> begin
(

let w_pos = w.FStar_Syntax_Syntax.pos
in (

let uu____10746 = (term_as_mlexpr env w)
in (match (uu____10746) with
| (w1, f_w, t_w) -> begin
(

let w2 = (maybe_coerce w_pos env w1 t_w FStar_Extraction_ML_Syntax.ml_bool_ty)
in ((FStar_Pervasives_Native.Some (w2)), (f_w)))
end)))
end)
in (match (uu____10723) with
| (when_opt1, f_when) -> begin
(

let uu____10795 = (term_as_mlexpr env branch1)
in (match (uu____10795) with
| (mlbranch, f_branch, t_branch) -> begin
(

let uu____10829 = (FStar_All.pipe_right p (FStar_List.map (fun uu____10906 -> (match (uu____10906) with
| (p1, wopt) -> begin
(

let when_clause = (FStar_Extraction_ML_Util.conjoin_opt wopt when_opt1)
in ((p1), (((when_clause), (f_when))), (((mlbranch), (f_branch), (t_branch)))))
end))))
in (((compat && pat_t_compat)), (uu____10829)))
end))
end))
end))
end))) true))
in (match (uu____10526) with
| (pat_t_compat, mlbranches) -> begin
(

let mlbranches1 = (FStar_List.flatten mlbranches)
in (

let e1 = (match (pat_t_compat) with
| true -> begin
e
end
| uu____11066 -> begin
((FStar_Extraction_ML_UEnv.debug g (fun uu____11071 -> (

let uu____11072 = (FStar_Extraction_ML_Code.string_of_mlexpr g.FStar_Extraction_ML_UEnv.currentModule e)
in (

let uu____11073 = (FStar_Extraction_ML_Code.string_of_mlty g.FStar_Extraction_ML_UEnv.currentModule t_e)
in (FStar_Util.print2 "Coercing scrutinee %s from type %s because pattern type is incompatible\n" uu____11072 uu____11073)))));
(FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t_e) (FStar_Extraction_ML_Syntax.MLE_Coerce (((e), (t_e), (FStar_Extraction_ML_Syntax.MLTY_Top)))));
)
end)
in (match (mlbranches1) with
| [] -> begin
(

let uu____11098 = (

let uu____11107 = (

let uu____11124 = (FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.failwith_lid FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)
in (FStar_Extraction_ML_UEnv.lookup_fv g uu____11124))
in (FStar_All.pipe_left FStar_Util.right uu____11107))
in (match (uu____11098) with
| (uu____11167, fw, uu____11169, uu____11170) -> begin
(

let uu____11171 = (

let uu____11172 = (

let uu____11173 = (

let uu____11180 = (

let uu____11183 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_string_ty) (FStar_Extraction_ML_Syntax.MLE_Const (FStar_Extraction_ML_Syntax.MLC_String ("unreachable"))))
in (uu____11183)::[])
in ((fw), (uu____11180)))
in FStar_Extraction_ML_Syntax.MLE_App (uu____11173))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_int_ty) uu____11172))
in ((uu____11171), (FStar_Extraction_ML_Syntax.E_PURE), (FStar_Extraction_ML_Syntax.ml_int_ty)))
end))
end
| ((uu____11186, uu____11187, (uu____11188, f_first, t_first)))::rest -> begin
(

let uu____11248 = (FStar_List.fold_left (fun uu____11290 uu____11291 -> (match (((uu____11290), (uu____11291))) with
| ((topt, f), (uu____11348, uu____11349, (uu____11350, f_branch, t_branch))) -> begin
(

let f1 = (FStar_Extraction_ML_Util.join top.FStar_Syntax_Syntax.pos f f_branch)
in (

let topt1 = (match (topt) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (t1) -> begin
(

let uu____11406 = (type_leq g t1 t_branch)
in (match (uu____11406) with
| true -> begin
FStar_Pervasives_Native.Some (t_branch)
end
| uu____11409 -> begin
(

let uu____11410 = (type_leq g t_branch t1)
in (match (uu____11410) with
| true -> begin
FStar_Pervasives_Native.Some (t1)
end
| uu____11413 -> begin
FStar_Pervasives_Native.None
end))
end))
end)
in ((topt1), (f1))))
end)) ((FStar_Pervasives_Native.Some (t_first)), (f_first)) rest)
in (match (uu____11248) with
| (topt, f_match) -> begin
(

let mlbranches2 = (FStar_All.pipe_right mlbranches1 (FStar_List.map (fun uu____11505 -> (match (uu____11505) with
| (p, (wopt, uu____11534), (b1, uu____11536, t1)) -> begin
(

let b2 = (match (topt) with
| FStar_Pervasives_Native.None -> begin
(FStar_Extraction_ML_Syntax.apply_obj_repr b1 t1)
end
| FStar_Pervasives_Native.Some (uu____11555) -> begin
b1
end)
in ((p), (wopt), (b2)))
end))))
in (

let t_match = (match (topt) with
| FStar_Pervasives_Native.None -> begin
FStar_Extraction_ML_Syntax.MLTY_Top
end
| FStar_Pervasives_Native.Some (t1) -> begin
t1
end)
in (

let uu____11560 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t_match) (FStar_Extraction_ML_Syntax.MLE_Match (((e1), (mlbranches2)))))
in ((uu____11560), (f_match), (t_match)))))
end))
end)))
end))
end))
end))
end))
end));
))


let ind_discriminator_body : FStar_Extraction_ML_UEnv.env  ->  FStar_Ident.lident  ->  FStar_Ident.lident  ->  FStar_Extraction_ML_Syntax.mlmodule1 = (fun env discName constrName -> (

let uu____11586 = (

let uu____11591 = (FStar_TypeChecker_Env.lookup_lid env.FStar_Extraction_ML_UEnv.tcenv discName)
in (FStar_All.pipe_left FStar_Pervasives_Native.fst uu____11591))
in (match (uu____11586) with
| (uu____11616, fstar_disc_type) -> begin
(

let wildcards = (

let uu____11625 = (

let uu____11626 = (FStar_Syntax_Subst.compress fstar_disc_type)
in uu____11626.FStar_Syntax_Syntax.n)
in (match (uu____11625) with
| FStar_Syntax_Syntax.Tm_arrow (binders, uu____11636) -> begin
(

let uu____11653 = (FStar_All.pipe_right binders (FStar_List.filter (fun uu___64_11687 -> (match (uu___64_11687) with
| (uu____11694, FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Implicit (uu____11695))) -> begin
true
end
| uu____11698 -> begin
false
end))))
in (FStar_All.pipe_right uu____11653 (FStar_List.map (fun uu____11731 -> (

let uu____11738 = (fresh "_")
in ((uu____11738), (FStar_Extraction_ML_Syntax.MLTY_Top)))))))
end
| uu____11739 -> begin
(failwith "Discriminator must be a function")
end))
in (

let mlid = (fresh "_discr_")
in (

let targ = FStar_Extraction_ML_Syntax.MLTY_Top
in (

let disc_ty = FStar_Extraction_ML_Syntax.MLTY_Top
in (

let discrBody = (

let uu____11750 = (

let uu____11751 = (

let uu____11762 = (

let uu____11763 = (

let uu____11764 = (

let uu____11779 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty targ) (FStar_Extraction_ML_Syntax.MLE_Name ((([]), (mlid)))))
in (

let uu____11782 = (

let uu____11793 = (

let uu____11802 = (

let uu____11803 = (

let uu____11810 = (FStar_Extraction_ML_Syntax.mlpath_of_lident constrName)
in ((uu____11810), ((FStar_Extraction_ML_Syntax.MLP_Wild)::[])))
in FStar_Extraction_ML_Syntax.MLP_CTor (uu____11803))
in (

let uu____11813 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_bool_ty) (FStar_Extraction_ML_Syntax.MLE_Const (FStar_Extraction_ML_Syntax.MLC_Bool (true))))
in ((uu____11802), (FStar_Pervasives_Native.None), (uu____11813))))
in (

let uu____11816 = (

let uu____11827 = (

let uu____11836 = (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_bool_ty) (FStar_Extraction_ML_Syntax.MLE_Const (FStar_Extraction_ML_Syntax.MLC_Bool (false))))
in ((FStar_Extraction_ML_Syntax.MLP_Wild), (FStar_Pervasives_Native.None), (uu____11836)))
in (uu____11827)::[])
in (uu____11793)::uu____11816))
in ((uu____11779), (uu____11782))))
in FStar_Extraction_ML_Syntax.MLE_Match (uu____11764))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.ml_bool_ty) uu____11763))
in (((FStar_List.append wildcards ((((mlid), (targ)))::[]))), (uu____11762)))
in FStar_Extraction_ML_Syntax.MLE_Fun (uu____11751))
in (FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty disc_ty) uu____11750))
in (

let uu____11891 = (

let uu____11892 = (

let uu____11895 = (

let uu____11896 = (FStar_Extraction_ML_UEnv.convIdent discName.FStar_Ident.ident)
in {FStar_Extraction_ML_Syntax.mllb_name = uu____11896; FStar_Extraction_ML_Syntax.mllb_tysc = FStar_Pervasives_Native.None; FStar_Extraction_ML_Syntax.mllb_add_unit = false; FStar_Extraction_ML_Syntax.mllb_def = discrBody; FStar_Extraction_ML_Syntax.mllb_meta = []; FStar_Extraction_ML_Syntax.print_typ = false})
in (uu____11895)::[])
in ((FStar_Extraction_ML_Syntax.NonRec), (uu____11892)))
in FStar_Extraction_ML_Syntax.MLM_Let (uu____11891)))))))
end)))




