(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
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

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (count_type count_type) Bool)

(declare-const dummy count_type)

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
  (forall ((x count_type)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__loop_types__lists__list__capacity count_type)))))
(define-fun us_split_discrs_rec__loop_types__lists__list__capacity__projection ((a us_split_discrs)) count_type 
  (rec__loop_types__lists__list__capacity a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__loop_types__lists__list us_main_type)))))
(define-fun us_split_fields_rec__loop_types__lists__list__projection ((a us_split_fields)) us_main_type 
  (rec__loop_types__lists__list a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__loop_types__lists__list__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__loop_types__lists__list__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__loop_types__lists__list
                           (us_split_fields1 a))
                           (rec__loop_types__lists__list
                           (us_split_fields1 b))) true))
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

(declare-const loop_types__lists__list__capacity__first__bit Int)

(declare-const loop_types__lists__list__capacity__last__bit Int)

(declare-const loop_types__lists__list__capacity__position Int)

;; loop_types__lists__list__capacity__first__bit_axiom
  (assert (<= 0 loop_types__lists__list__capacity__first__bit))

;; loop_types__lists__list__capacity__last__bit_axiom
  (assert
  (< loop_types__lists__list__capacity__first__bit loop_types__lists__list__capacity__last__bit))

;; loop_types__lists__list__capacity__position_axiom
  (assert (<= 0 loop_types__lists__list__capacity__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((list_t__ref (list_t__refqtmk (list_t__content us_rep)))))
(define-fun list_t__ref_list_t__content__projection ((a list_t__ref)) us_rep 
  (list_t__content a))

(define-fun in_range2 ((rec__loop_types__lists__list__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__loop_types__lists__list__capacity1 
  (to_rep (rec__loop_types__lists__list__capacity a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const loop_types__lists__list__capacity__first__bit1 Int)

(declare-const loop_types__lists__list__capacity__last__bit1 Int)

(declare-const loop_types__lists__list__capacity__position1 Int)

;; loop_types__lists__list__capacity__first__bit_axiom
  (assert (<= 0 loop_types__lists__list__capacity__first__bit1))

;; loop_types__lists__list__capacity__last__bit_axiom
  (assert
  (< loop_types__lists__list__capacity__first__bit1 loop_types__lists__list__capacity__last__bit1))

;; loop_types__lists__list__capacity__position_axiom
  (assert (<= 0 loop_types__lists__list__capacity__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes () ((list__ref (list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-const l__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1 (rec__loop_types__lists__cursor__node count_type)))))
(define-fun us_split_fields_rec__loop_types__lists__cursor__node__projection ((a us_split_fields2)) count_type 
  (rec__loop_types__lists__cursor__node a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (to_rep
                            (rec__loop_types__lists__cursor__node
                            (us_split_fields3 a))) (to_rep
                                                   (rec__loop_types__lists__cursor__node
                                                   (us_split_fields3 b))))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const loop_types__lists__cursor__node__first__bit Int)

(declare-const loop_types__lists__cursor__node__last__bit Int)

(declare-const loop_types__lists__cursor__node__position Int)

;; loop_types__lists__cursor__node__first__bit_axiom
  (assert (<= 0 loop_types__lists__cursor__node__first__bit))

;; loop_types__lists__cursor__node__last__bit_axiom
  (assert
  (< loop_types__lists__cursor__node__first__bit loop_types__lists__cursor__node__last__bit))

;; loop_types__lists__cursor__node__position_axiom
  (assert (<= 0 loop_types__lists__cursor__node__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ()
((cursor__ref (cursor__refqtmk (cursor__content us_rep1)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep1 
  (cursor__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq4 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes () ((map__ref (map__refqtmk (map__content us_rep2)))))
(define-fun map__ref_map__content__projection ((a map__ref)) us_rep2 
  (map__content a))

(declare-datatypes ()
((key_type__ref (key_type__refqtmk (key_type__content us_rep1)))))
(define-fun key_type__ref_key_type__content__projection ((a key_type__ref)) us_rep1 
  (key_type__content a))

(declare-fun get (us_rep2 us_rep1) Int)

(declare-fun get__function_guard (Int us_rep2 us_rep1) Bool)

(declare-fun has_key (us_rep2 us_rep1) Bool)

(declare-fun has_key__function_guard (Bool us_rep2 us_rep1) Bool)

(declare-fun witness (us_rep2 us_rep1) Int)

(declare-fun witness__function_guard (Int us_rep2 us_rep1) Bool)

(declare-fun w_get (us_rep2 Int) Int)

(declare-fun w_get__function_guard (Int us_rep2 Int) Bool)

(declare-fun oeq (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard (Bool us_rep2 us_rep2) Bool)

(declare-fun is_empty (us_rep2) Bool)

(declare-fun is_empty__function_guard (Bool us_rep2) Bool)

(declare-fun length (us_rep2) Int)

(declare-fun length__function_guard (Int us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq4 a b) (oeq a b)) :pattern ((user_eq4 a b)) )))

(define-fun default_initial_assumption ((temp___expr_217 us_rep2)
  (temp___skip_top_level_218 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_218 true))
                                         (and
                                         (= (is_empty temp___expr_217) true)
                                         (= (length temp___expr_217) 0))))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant ((temp___expr_249 Int)
  (temp___is_init_245 Bool) (temp___skip_constant_246 Bool)
  (temp___do_toplevel_247 Bool)
  (temp___do_typ_inv_248 Bool)) Bool (=>
                                     (or (= temp___is_init_245 true)
                                     (<= 1 2147483647)) (in_range3
                                     temp___expr_249)))

(define-fun default_initial_assumption1 ((temp___expr_225 us_rep1)
  (temp___skip_top_level_226 Bool)) Bool (= (to_rep
                                            (rec__loop_types__lists__cursor__node
                                            (us_split_fields3
                                            temp___expr_225))) 0))

;; get__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((key us_rep1))
  (! (=> (= (has_key container key) true)
     (let ((result (get container key)))
     (and
     (=> (= (distinct 0 0) true)
     (and (= result (w_get container (witness container key)))
     (forall ((k us_rep1))
     (=> (= (has_key container k) true)
     (= (= (bool_eq1 k key) true)
     (= (witness container key) (witness container k)))))))
     (dynamic_invariant result true false true true)))) :pattern ((get
                                                                  container
                                                                  key)) ))))

(declare-fun positions (us_rep) us_rep2)

(declare-fun positions__function_guard (us_rep2 us_rep) Bool)

(declare-fun length1 (us_rep) Int)

(declare-fun length__function_guard1 (Int us_rep) Bool)

(declare-const no_element us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

;; positions__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (positions container)))
     (and (not (= (has_key result no_element) true))
     (forall ((i us_rep1))
     (=> (= (has_key result i) true)
     (and
     (let ((temp___260 (get result i)))
     (and (<= 1 temp___260) (<= temp___260 (length1 container))))
     (forall ((j us_rep1))
     (=> (= (has_key result j) true)
     (=> (= (get result i) (get result j)) (= (bool_eq1 i j) true))))))))) :pattern (
  (positions container)) )))

(define-fun has_element ((container us_rep)
  (position us_rep1)) Bool (has_key (positions container) position))

(declare-fun has_element__function_guard (Bool us_rep us_rep1) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-fun first (us_rep) us_rep1)

(declare-fun first__function_guard (us_rep1 us_rep) Bool)

(define-fun default_initial_assumption2 ((temp___expr_208 us_rep1)
  (temp___skip_top_level_209 Bool)) Bool (= (to_rep
                                            (rec__loop_types__lists__cursor__node
                                            (us_split_fields3
                                            temp___expr_208))) 0))

;; first__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (first container)))
     (ite (= (length1 container) 0) (= (bool_eq1 result no_element) true)
     (and (= (has_element container result) true)
     (= (get (positions container) result) 1)))) :pattern ((first container)) )))

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep3 0)

(declare-fun bool_eq3 (us_rep3 us_rep3) Bool)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-fun user_eq6 (us_rep3 us_rep3) Bool)

(declare-const dummy6 us_rep3)

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep3)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep3 
  (sequence__content a))

(declare-fun length3 (us_rep3) Int)

(declare-fun length__function_guard2 (Int us_rep3) Bool)

(define-fun last ((container us_rep3)) Int (+ 0 (length3 container)))

(declare-fun last__function_guard (Int us_rep3) Bool)

(define-fun iter_has_element ((container us_rep3)
  (position Int)) Bool (and (ite (<= 1 position) true false) (ite (<= position 
                                                             (last container))
                                                             true false)))

(declare-fun iter_has_element__function_guard (Bool us_rep3 Int) Bool)

(declare-fun get1 (us_rep3 Int) Int)

(declare-fun get__function_guard1 (Int us_rep3 Int) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 0 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq7 (element_type1 element_type1) Bool)

(declare-const dummy7 element_type1)

(declare-datatypes ()
((element_type__ref1
 (element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant1 ((temp___expr_304 Int)
  (temp___is_init_300 Bool) (temp___skip_constant_301 Bool)
  (temp___do_toplevel_302 Bool)
  (temp___do_typ_inv_303 Bool)) Bool (=>
                                     (or (= temp___is_init_300 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_304)))

(define-fun default_initial_assumption3 ((temp___expr_312 us_rep3)
  (temp___skip_top_level_313 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_313 true))
                                         (= (length3 temp___expr_312) 0)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq8 (extended_index extended_index) Bool)

(declare-const dummy8 extended_index)

(declare-datatypes ()
((extended_index__ref
 (extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant2 ((temp___expr_326 Int)
  (temp___is_init_322 Bool) (temp___skip_constant_323 Bool)
  (temp___do_toplevel_324 Bool)
  (temp___do_typ_inv_325 Bool)) Bool (=>
                                     (or (= temp___is_init_322 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_326)))

;; get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant2 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant1 (get1 container position) true false true true)) :pattern (
  (get1 container position)) ))))

(declare-fun model1 (us_rep) us_rep3)

(declare-fun model__function_guard (us_rep3 us_rep) Bool)

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length3 (model1 container)) (length1 container)) :pattern ((model1
                                                                    container)) )))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun equal_except ((left us_rep3) (right us_rep3)
  (position Int)) Bool (and (= (length3 left) (length3 right)) (ite (forall
                                                                    ((i Int))
                                                                    (=>
                                                                    (and
                                                                    (<= 1 i)
                                                                    (<= i 
                                                                    (last
                                                                    left)))
                                                                    (=>
                                                                    (not
                                                                    (= i position))
                                                                    (= 
                                                                    (get1
                                                                    left i) 
                                                                    (get1
                                                                    right i)))))
                                                               true false)))

(declare-fun equal_except__function_guard (Bool us_rep3 us_rep3 Int) Bool)

(define-fun dynamic_invariant3 ((temp___expr_188 Int)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (or (= temp___is_init_184 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_188)))

(declare-const rliteral count_type)

;; rliteral_axiom
  (assert (= (count_typeqtint rliteral) 0))

;; no_element__def_axiom
  (assert (= no_element (us_repqtmk1 (us_split_fieldsqtmk1 rliteral))))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length1 container)))
     (and
     (<= result (to_rep
                (rec__loop_types__lists__list__capacity
                (us_split_discrs1 container))))
     (dynamic_invariant3 result true false true true))) :pattern ((length1
                                                                  container)) )))

;; length__post_axiom
  (assert
  (forall ((container us_rep3))
  (! (let ((result (length3 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant3 result true false
     true true))) :pattern ((length3 container)) )))

;; has_key__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((key us_rep1))
  (! (=> (= (distinct 0 0) true)
     (=>
     (exists ((k us_rep1))
     (and (= (has_key container k) true) (= (bool_eq1 k key) true)))
     (= (has_key container key) true))) :pattern ((has_key container key)) ))))

;; length__post_axiom
  (assert
  (forall ((container us_rep2)) (! (dynamic_invariant3 (length container)
  true false true true) :pattern ((length container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (oeq left right) true)
     (and
     (forall ((key us_rep1))
     (=> (= (has_key left key) true)
     (and (= (has_key right key) true) (= (get right key) (get left key)))))
     (forall ((key us_rep1))
     (=> (= (has_key right key) true) (= (has_key left key) true))))) :pattern (
  (oeq left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (= (= (is_empty container) true)
     (forall ((key us_rep1)) (not (= (has_key container key) true)))) :pattern (
  (is_empty container)) )))

(declare-fun has_witness (us_rep2 Int) Bool)

(declare-fun has_witness__function_guard (Bool us_rep2 Int) Bool)

;; has_witness__post_axiom
  (assert true)

;; witness__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((key us_rep1))
  (! (=> (= (has_key container key) true)
     (let ((result (witness container key)))
     (and (= (has_witness container result) true) (dynamic_invariant3 result
     true false true true)))) :pattern ((witness container key)) ))))

;; w_get__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((witness1 Int))
  (! (=>
     (and (dynamic_invariant3 witness1 true true true true)
     (= (has_witness container witness1) true)) (dynamic_invariant
     (w_get container witness1) true false true true)) :pattern ((w_get
                                                                 container
                                                                 witness1)) ))))

(declare-const l__split_fields us_main_type)

;; Assume
  (assert true)

(define-fun o () us_rep (us_repqtmk l__split_discrs
                        (us_split_fieldsqtmk l__split_fields)))

(define-fun init_list_zero__cu__assume () us_rep1 (first o))

;; H
  (assert true)

;; H
  (assert
  (ite (= (= (length1 o) 0) true)
  (= (bool_eq1 init_list_zero__cu__assume no_element) true)
  (and (= (has_element o init_list_zero__cu__assume) true)
  (= (get (positions o) init_list_zero__cu__assume) 1))))

(declare-const cu__split_fields count_type)

;; H
  (assert
  (= (us_split_fieldsqtmk1 cu__split_fields) (us_split_fields3
                                             init_list_zero__cu__assume)))

;; Assume
  (assert true)

(define-fun o1 () us_rep1 (us_repqtmk1
                          (us_split_fieldsqtmk1 cu__split_fields)))

(define-fun o2 () us_rep (us_repqtmk l__split_discrs
                         (us_split_fieldsqtmk l__split_fields)))

(define-fun o3 () Bool (has_element o2 o1))

;; Ensures
  (assert (= (= o3 true) (= (has_key (positions o2) o1) true)))

;; H
  (assert (= o3 true))

;; H
  (assert true)

;; H
  (assert
  (not
  (= (has_key
     (positions
     (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields)))
     no_element) true)))

;; H
  (assert
  (let ((o4 (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields))))
  (let ((o5 (positions o4)))
  (forall ((i us_rep1))
  (=> (= (has_key o5 i) true)
  (and
  (let ((temp___256 (get o5 i)))
  (and (<= 1 temp___256) (<= temp___256 (length1 o4))))
  (forall ((j us_rep1))
  (=> (= (has_key o5 j) true)
  (=> (= (get o5 i) (get o5 j)) (= (bool_eq1 i j) true))))))))))

;; H
  (assert (dynamic_invariant
  (get
  (positions
  (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields)))
  (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields))) true false true
  true))

;; H
  (assert
  (let ((o4 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields))))
  (let ((o5 (positions
            (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields)))))
  (=> (= (distinct 0 0) true)
  (and (= (get o5 o4) (w_get o5 (witness o5 o4)))
  (forall ((k us_rep1))
  (=> (= (has_key o5 k) true)
  (= (= (bool_eq1 k o4) true) (= (witness o5 o4) (witness o5 k))))))))))

(declare-const l__split_fields1 us_main_type)

(declare-const cu__split_fields1 count_type)

;; LoopInvariant
  (assert
  (forall ((i Int))
  (=>
  (and (<= 1 i)
  (<= i (- (get
           (positions
           (us_repqtmk l__split_discrs
           (us_split_fieldsqtmk l__split_fields1)))
           (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))) 1)))
  (= (get1
     (model1
     (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields1))) i) 0))))

;; H
  (assert
  (= (and (ite true true false) (ite (= (has_element
                                        (us_repqtmk l__split_discrs
                                        (us_split_fieldsqtmk
                                        l__split_fields1))
                                        (us_repqtmk1
                                        (us_split_fieldsqtmk1
                                        cu__split_fields1))) true)
                                true false)) true))

(define-fun o4 () us_rep1 (us_repqtmk1
                          (us_split_fieldsqtmk1 cu__split_fields1)))

(define-fun o5 () us_split_discrs l__split_discrs)

(declare-const loop_types__lists__replace_element__container__fields us_main_type)

;; H
  (assert
  (= (length1
     (us_repqtmk o5
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields))) (length1
                                                              (us_repqtmk 
                                                              o5
                                                              (us_split_fieldsqtmk
                                                              l__split_fields1)))))

;; H
  (assert
  (= (oeq (positions (us_repqtmk o5 (us_split_fieldsqtmk l__split_fields1)))
     (positions
     (us_repqtmk o5
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields)))) true))

;; H
  (assert
  (= (get1
     (model1
     (us_repqtmk o5
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields)))
     (get
     (positions
     (us_repqtmk o5
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields))) o4)) 0))

;; H
  (assert
  (= (equal_except
     (model1 (us_repqtmk o5 (us_split_fieldsqtmk l__split_fields1)))
     (model1
     (us_repqtmk o5
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields)))
     (get
     (positions
     (us_repqtmk o5
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields))) o4)) true))

;; H
  (assert true)

(declare-const l__split_fields2 us_main_type)

;; H
  (assert
  (= l__split_fields2 loop_types__lists__replace_element__container__fields))

;; Assume
  (assert true)

(define-fun o6 () us_rep (us_repqtmk l__split_discrs
                         (us_split_fieldsqtmk l__split_fields2)))

(assert
;; defqtvc
 ;; File "init_list_zero.adb", line 5, characters 0-0
  (not
  (or
  (= (has_element o6 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))) true)
  (= (bool_eq1 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))
     no_element) true))))
(check-sat)
