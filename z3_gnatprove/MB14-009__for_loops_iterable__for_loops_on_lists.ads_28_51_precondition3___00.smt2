;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (count_type count_type) Bool)

(declare-const dummy2 count_type)

(declare-datatypes ()
((count_type__ref (count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__for_loops_on_lists__my_lists__cursor__node count_type)))))
(define-fun us_split_fields_rec__for_loops_on_lists__my_lists__cursor__node__projection ((a us_split_fields)) count_type 
  (rec__for_loops_on_lists__my_lists__cursor__node a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__for_loops_on_lists__my_lists__cursor__node
                           (us_split_fields1 a))) (to_rep
                                                  (rec__for_loops_on_lists__my_lists__cursor__node
                                                  (us_split_fields1 b))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const for_loops_on_lists__my_lists__cursor__node__first__bit Int)

(declare-const for_loops_on_lists__my_lists__cursor__node__last__bit Int)

(declare-const for_loops_on_lists__my_lists__cursor__node__position Int)

;; for_loops_on_lists__my_lists__cursor__node__first__bit_axiom
  (assert (<= 0 for_loops_on_lists__my_lists__cursor__node__first__bit))

;; for_loops_on_lists__my_lists__cursor__node__last__bit_axiom
  (assert
  (< for_loops_on_lists__my_lists__cursor__node__first__bit for_loops_on_lists__my_lists__cursor__node__last__bit))

;; for_loops_on_lists__my_lists__cursor__node__position_axiom
  (assert (<= 0 for_loops_on_lists__my_lists__cursor__node__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((cursor__ref (cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(declare-fun length (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 0 (element_typeqtint i)) (<= (element_typeqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_274 Int)
  (temp___is_init_270 Bool) (temp___skip_constant_271 Bool)
  (temp___do_toplevel_272 Bool)
  (temp___do_typ_inv_273 Bool)) Bool (=>
                                     (or (= temp___is_init_270 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_274)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (extended_index extended_index) Bool)

(declare-const dummy6 extended_index)

(declare-datatypes ()
((extended_index__ref
 (extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant2 ((temp___expr_281 Int)
  (temp___is_init_277 Bool) (temp___skip_constant_278 Bool)
  (temp___do_toplevel_279 Bool)
  (temp___do_typ_inv_280 Bool)) Bool (=>
                                     (or (= temp___is_init_277 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_281)))

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq ((left us_rep1)
  (right us_rep1)) Bool (and (= (length left) (length right)) (ite (forall
                                                                   ((n Int))
                                                                   (=>
                                                                   (and
                                                                   (<= 1 n)
                                                                   (<= n 
                                                                   (last
                                                                   left)))
                                                                   (= 
                                                                   (get left
                                                                   n) 
                                                                   (get right
                                                                   n))))
                                                              true false)))

(declare-fun oeq__function_guard (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq4 a b) (oeq a b)) :pattern ((user_eq4 a b)) )))

(define-fun default_initial_assumption ((temp___expr_289 us_rep1)
  (temp___skip_top_level_290 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_290 true))
                                         (= (length temp___expr_289) 0)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant2 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant1 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(define-fun iter_has_element ((container us_rep1)
  (position Int)) Bool (and (ite (<= 1 position) true false) (ite (<= position 
                                                             (last container))
                                                             true false)))

(declare-fun iter_has_element__function_guard (Bool us_rep1 Int) Bool)

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk
 (rec__for_loops_on_lists__my_lists__list__capacity count_type)))))
(define-fun us_split_discrs_rec__for_loops_on_lists__my_lists__list__capacity__projection ((a us_split_discrs)) count_type 
  (rec__for_loops_on_lists__my_lists__list__capacity a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__for_loops_on_lists__my_lists__list us_main_type1)))))
(define-fun us_split_fields_rec__for_loops_on_lists__my_lists__list__projection ((a us_split_fields2)) us_main_type1 
  (rec__for_loops_on_lists__my_lists__list a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep2
 (us_repqtmk1
 (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (to_rep
                            (rec__for_loops_on_lists__my_lists__list__capacity
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__for_loops_on_lists__my_lists__list__capacity
                                                   (us_split_discrs1 b))))
                         (= (us_main_eq1
                            (rec__for_loops_on_lists__my_lists__list
                            (us_split_fields3 a))
                            (rec__for_loops_on_lists__my_lists__list
                            (us_split_fields3 b))) true))
                    true false))

(define-fun in_range6 ((rec__for_loops_on_lists__my_lists__list__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__for_loops_on_lists__my_lists__list__capacity1 
  (to_rep (rec__for_loops_on_lists__my_lists__list__capacity a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const for_loops_on_lists__my_lists__list__capacity__first__bit Int)

(declare-const for_loops_on_lists__my_lists__list__capacity__last__bit Int)

(declare-const for_loops_on_lists__my_lists__list__capacity__position Int)

;; for_loops_on_lists__my_lists__list__capacity__first__bit_axiom
  (assert (<= 0 for_loops_on_lists__my_lists__list__capacity__first__bit))

;; for_loops_on_lists__my_lists__list__capacity__last__bit_axiom
  (assert
  (< for_loops_on_lists__my_lists__list__capacity__first__bit for_loops_on_lists__my_lists__list__capacity__last__bit))

;; for_loops_on_lists__my_lists__list__capacity__position_axiom
  (assert (<= 0 for_loops_on_lists__my_lists__list__capacity__position))

(declare-fun user_eq7 (us_rep2 us_rep2) Bool)

(declare-const dummy7 us_rep2)

(declare-datatypes () ((list__ref (list__refqtmk (list__content us_rep2)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep2 
  (list__content a))

(declare-fun model1 (us_rep2) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep2) Bool)

(declare-fun length2 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(declare-fun oeq1 (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard1 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq7 a b) (oeq1 a b)) :pattern ((user_eq7 a b)) )))

;; model__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (= (length (model1 container)) (length2 container)) :pattern ((model1
                                                                   container)) )))

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep3 0)

(declare-fun bool_eq3 (us_rep3 us_rep3) Bool)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq8 (us_rep3 us_rep3) Bool)

(declare-const dummy8 us_rep3)

(declare-datatypes () ((map__ref (map__refqtmk (map__content us_rep3)))))
(define-fun map__ref_map__content__projection ((a map__ref)) us_rep3 
  (map__content a))

(declare-datatypes ()
((key_type__ref (key_type__refqtmk (key_type__content us_rep)))))
(define-fun key_type__ref_key_type__content__projection ((a key_type__ref)) us_rep 
  (key_type__content a))

(declare-fun has_key (us_rep3 us_rep) Bool)

(declare-fun has_key__function_guard (Bool us_rep3 us_rep) Bool)

(declare-fun positions (us_rep2) us_rep3)

(declare-fun positions__function_guard (us_rep3 us_rep2) Bool)

(define-fun has_element ((container us_rep2)
  (position us_rep)) Bool (has_key (positions container) position))

(declare-fun has_element__function_guard (Bool us_rep2 us_rep) Bool)

(declare-fun get1 (us_rep3 us_rep) Int)

(declare-fun get__function_guard1 (Int us_rep3 us_rep) Bool)

(define-fun element ((container us_rep2)
  (position us_rep)) Int (get (model1 container)
                         (get1 (positions container) position)))

(declare-fun element__function_guard (Int us_rep2 us_rep) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 0 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (element_type1 element_type1) Bool)

(declare-const dummy9 element_type1)

(declare-datatypes ()
((element_type__ref1
 (element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant3 ((temp___expr_231 Int)
  (temp___is_init_227 Bool) (temp___skip_constant_228 Bool)
  (temp___do_toplevel_229 Bool)
  (temp___do_typ_inv_230 Bool)) Bool (=>
                                     (or (= temp___is_init_227 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_231)))

(define-fun default_initial_assumption1 ((temp___expr_252 us_rep)
  (temp___skip_top_level_253 Bool)) Bool (= (to_rep
                                            (rec__for_loops_on_lists__my_lists__cursor__node
                                            (us_split_fields1
                                            temp___expr_252))) 0))

(declare-const no_element us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun first (us_rep2) us_rep)

(declare-fun first__function_guard (us_rep us_rep2) Bool)

;; first__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (first container)))
     (ite (= (length2 container) 0) (= (bool_eq result no_element) true)
     (and (= (has_element container result) true)
     (= (get1 (positions container) result) 1)))) :pattern ((first container)) )))

(declare-fun next (us_rep2 us_rep) us_rep)

(declare-fun next__function_guard (us_rep us_rep2 us_rep) Bool)

;; next__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((position us_rep))
  (! (=>
     (or (= (has_element container position) true)
     (= (bool_eq position no_element) true))
     (let ((result (next container position)))
     (ite (or (= (bool_eq position no_element) true)
          (= (get1 (positions container) position) (length2 container)))
     (= (bool_eq result no_element) true)
     (and (= (has_element container result) true)
     (= (get1 (positions container) result) (+ (get1 (positions container)
                                               position) 1)))))) :pattern (
  (next container position)) ))))

(declare-const l us_rep2)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant5 ((temp___expr_238 Int)
  (temp___is_init_234 Bool) (temp___skip_constant_235 Bool)
  (temp___do_toplevel_236 Bool)
  (temp___do_typ_inv_237 Bool)) Bool (=>
                                     (or (= temp___is_init_234 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_238)))

(declare-const rliteral count_type)

;; rliteral_axiom
  (assert (= (count_typeqtint rliteral) 0))

;; no_element__def_axiom
  (assert (= no_element (us_repqtmk (us_split_fieldsqtmk rliteral))))

;; length__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (length2 container)))
     (and
     (<= result (to_rep
                (rec__for_loops_on_lists__my_lists__list__capacity
                (us_split_discrs1 container))))
     (dynamic_invariant5 result true false true true))) :pattern ((length2
                                                                  container)) )))

(declare-fun length3 (us_rep3) Int)

(declare-fun length__function_guard2 (Int us_rep3) Bool)

(declare-fun oeq2 (us_rep3 us_rep3) Bool)

(declare-fun oeq__function_guard2 (Bool us_rep3 us_rep3) Bool)

(declare-fun is_empty (us_rep3) Bool)

(declare-fun is_empty__function_guard (Bool us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq8 a b) (oeq2 a b)) :pattern ((user_eq8 a b)) )))

(define-fun default_initial_assumption2 ((temp___expr_311 us_rep3)
  (temp___skip_top_level_312 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_312 true))
                                         (and
                                         (= (is_empty temp___expr_311) true)
                                         (= (length3 temp___expr_311) 0))))

(define-fun default_initial_assumption3 ((temp___expr_297 us_rep)
  (temp___skip_top_level_298 Bool)) Bool (= (to_rep
                                            (rec__for_loops_on_lists__my_lists__cursor__node
                                            (us_split_fields1
                                            temp___expr_297))) 0))

;; positions__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (positions container)))
     (and (not (= (has_key result no_element) true))
     (forall ((i us_rep))
     (=> (= (has_key result i) true)
     (and
     (let ((temp___363 (get1 result i)))
     (and (<= 1 temp___363) (<= temp___363 (length2 container))))
     (forall ((j us_rep))
     (=> (= (has_key result j) true)
     (=> (= (get1 result i) (get1 result j)) (= (bool_eq i j) true))))))))) :pattern (
  (positions container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (oeq1 left right) true)
     (= (oeq (model1 left) (model1 right)) true)) :pattern ((oeq1 left right)) )))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant5 result true false
     true true))) :pattern ((length container)) )))

;; has_key__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((key us_rep))
  (! (=> (= (distinct 0 0) true)
     (=>
     (exists ((k us_rep))
     (and (= (has_key container k) true) (= (bool_eq k key) true)))
     (= (has_key container key) true))) :pattern ((has_key container key)) ))))

(declare-fun witness (us_rep3 us_rep) Int)

(declare-fun witness__function_guard (Int us_rep3 us_rep) Bool)

(declare-fun w_get (us_rep3 Int) Int)

(declare-fun w_get__function_guard (Int us_rep3 Int) Bool)

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 1 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq10 (element_type2 element_type2) Bool)

(declare-const dummy10 element_type2)

(declare-datatypes ()
((element_type__ref2
 (element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(define-fun dynamic_invariant6 ((temp___expr_303 Int)
  (temp___is_init_299 Bool) (temp___skip_constant_300 Bool)
  (temp___do_toplevel_301 Bool)
  (temp___do_typ_inv_302 Bool)) Bool (=>
                                     (or (= temp___is_init_299 true)
                                     (<= 1 2147483647)) (in_range8
                                     temp___expr_303)))

;; get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((key us_rep))
  (! (=> (= (has_key container key) true)
     (let ((result (get1 container key)))
     (and
     (=> (= (distinct 0 0) true)
     (and (= result (w_get container (witness container key)))
     (forall ((k us_rep))
     (=> (= (has_key container k) true)
     (= (= (bool_eq k key) true)
     (= (witness container key) (witness container k)))))))
     (dynamic_invariant6 result true false true true)))) :pattern ((get1
                                                                   container
                                                                   key)) ))))

;; length__post_axiom
  (assert
  (forall ((container us_rep3)) (! (dynamic_invariant5 (length3 container)
  true false true true) :pattern ((length3 container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep3) (right us_rep3))
  (! (= (= (oeq2 left right) true)
     (and
     (forall ((key us_rep))
     (=> (= (has_key left key) true)
     (and (= (has_key right key) true) (= (get1 right key) (get1 left key)))))
     (forall ((key us_rep))
     (=> (= (has_key right key) true) (= (has_key left key) true))))) :pattern (
  (oeq2 left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep3))
  (! (= (= (is_empty container) true)
     (forall ((key us_rep)) (not (= (has_key container key) true)))) :pattern (
  (is_empty container)) )))

(declare-fun has_witness (us_rep3 Int) Bool)

(declare-fun has_witness__function_guard (Bool us_rep3 Int) Bool)

;; has_witness__post_axiom
  (assert true)

;; witness__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((key us_rep))
  (! (=> (= (has_key container key) true)
     (let ((result (witness container key)))
     (and (= (has_witness container result) true) (dynamic_invariant5 result
     true false true true)))) :pattern ((witness container key)) ))))

;; w_get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((witness1 Int))
  (! (=>
     (and (dynamic_invariant5 witness1 true true true true)
     (= (has_witness container witness1) true)) (dynamic_invariant6
     (w_get container witness1) true false true true)) :pattern ((w_get
                                                                 container
                                                                 witness1)) ))))

(declare-const e Int)

;; Assume
  (assert true)

(declare-const count_0 Int)

;; H
  (assert (= count_0 0))

;; Assume
  (assert (dynamic_invariant count_0 true false true true))

(declare-const count_1 Int)

;; H
  (assert (= count_1 0))

;; Assume
  (assert (dynamic_invariant count_1 true false true true))

(declare-const count_01 Int)

(declare-const count_11 Int)

;; H
  (assert true)

;; H
  (assert
  (let ((o l))
  (let ((o1 (first o)))
  (ite (= (= (length2 o) 0) true) (= (bool_eq o1 no_element) true)
  (and (= (has_element o o1) true) (= (get1 (positions o) o1) 1))))))

;; H
  (assert
  (let ((o (first l)))
  (let ((o1 l))
  (= (= (has_element o1 o) true) (= (has_key (positions o1) o) true)))))

(declare-const e1 Int)

;; H
  (assert
  (let ((o (first l)))
  (ite (= (has_element l o) true)
  (let ((o1 l))
  (let ((o2 (element o1 o)))
  (and
  (and (dynamic_invariant3 o2 true false true true)
  (= o2 (get (model1 o1) (get1 (positions o1) o)))) (= e1 o2)))) (= e1 
  e))))

;; H
  (assert
  (let ((o (first l)))
  (let ((o1 l))
  (= (= (has_element o1 o) true) (= (has_key (positions o1) o) true)))))

;; H
  (assert
  (ite (= (has_element l (first l)) true)
  (exists ((spark__branch Bool) (count_02 Int))
  (and
  (and (= spark__branch (ite (= e1 0) true false))
  (ite (= spark__branch true)
  (let ((o (+ count_0 1))) (and (in_range1 o) (= count_02 o)))
  (= count_02 count_0)))
  (and
  (or (not (< 0 count_02))
  (exists ((usf count_type))
  (let ((usf1 (us_repqtmk (us_split_fieldsqtmk usf))))
  (let ((o l))
  (= (= (has_element o usf1) true) (= (has_key (positions o) usf1) true))))))
  (exists ((count_12 Int) (e2 Int) (temp___1052 count_type))
  (and
  (and
  (=> (< 0 count_01)
  (exists ((cu us_rep))
  (and (= (has_element l cu) true) (= (element l cu) 0))))
  (=> (< 0 count_12)
  (exists ((cu us_rep))
  (and (= (has_element l cu) true) (= (element l cu) 1)))))
  (and
  (= (and (ite (and
               (and (dynamic_invariant count_01 true true true true)
               (dynamic_invariant count_12 true true true true))
               (dynamic_invariant3 e2 true true true true))
          true false) (ite (and
                           (= (has_element l
                              (us_repqtmk (us_split_fieldsqtmk temp___1052))) true)
                           (= e2 (element l
                                 (us_repqtmk
                                 (us_split_fieldsqtmk temp___1052)))))
                      true false)) true)
  (exists ((spark__branch1 Bool))
  (and
  (and (= spark__branch1 (ite (= e2 1) true false))
  (ite (= spark__branch1 true)
  (let ((o (+ count_12 1))) (and (in_range1 o) (= count_11 o)))
  (= count_11 count_12)))
  (let ((o (us_repqtmk (us_split_fieldsqtmk temp___1052))))
  (let ((o1 l))
  (let ((o2 (next o1 o)))
  (and
  (ite (= (or (bool_eq o no_element) (= (get1 (positions o1) o) (length2 o1))) true)
  (= (bool_eq o2 no_element) true)
  (and (= (has_element o1 o2) true)
  (= (get1 (positions o1) o2) (+ (get1 (positions o1) o) 1))))
  (let ((o3 l))
  (let ((o4 (has_element o3 o2)))
  (and (= (= o4 true) (= (has_key (positions o3) o2) true))
  (not (= o4 true)))))))))))))))))
  (and (= count_01 count_0) (= count_11 count_1))))

(declare-const for_loops_on_lists__count_for_of__result Bool)

;; H
  (assert
  (= for_loops_on_lists__count_for_of__result (ite (< 0 count_11)
                                              (ite (< 0 count_01) true false)
                                              false)))

;; H
  (assert (= for_loops_on_lists__count_for_of__result true))

(define-fun o () us_rep2 l)

(define-fun temp___1058 () us_rep1 (model1 o))

;; H
  (assert true)

;; H
  (assert (= (length temp___1058) (length2 o)))

(declare-const usf Int)

(define-fun o1 () Bool (iter_has_element temp___1058 usf))

;; Ensures
  (assert (= (= o1 true) (and (<= 1 usf) (<= usf (last temp___1058)))))

;; H
  (assert (= (and (ite (in_range5 usf) true false) o1) true))

(assert
;; defqtvc
 ;; File "for_loops_on_lists.ads", line 26, characters 0-0
  (not (<= 1 usf)))
(check-sat)