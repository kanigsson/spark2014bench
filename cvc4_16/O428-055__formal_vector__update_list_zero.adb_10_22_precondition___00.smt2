(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
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

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__loop_types__lists__list__capacity count_type)))))
(define-fun us_split_discrs_rec__loop_types__lists__list__capacity__projection ((a us_split_discrs)) count_type 
  (rec__loop_types__lists__list__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__loop_types__lists__list us_main_type)))))
(define-fun us_split_fields_rec__loop_types__lists__list__projection ((a us_split_fields)) us_main_type 
  (rec__loop_types__lists__list a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
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

(declare-datatypes ((list_t__ref 0))
(((list_t__refqtmk (list_t__content us_rep)))))
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

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-const l__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const threshold Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_187)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and
     (<= result (to_rep
                (rec__loop_types__lists__list__capacity
                (us_split_discrs1 container))))
     (dynamic_invariant result true false true true))) :pattern ((length
                                                                 container)) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 0 (element_typeqtint i)) (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (element_type element_type) Bool)

(declare-const dummy4 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_222 Int)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (or (= temp___is_init_218 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_222)))

(define-fun default_initial_assumption ((temp___expr_230 us_rep1)
  (temp___skip_top_level_231 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_231 true))
                                         (= (length1 temp___expr_230) 0)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (extended_index extended_index) Bool)

(declare-const dummy5 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant2 ((temp___expr_251 Int)
  (temp___is_init_247 Bool) (temp___skip_constant_248 Bool)
  (temp___do_toplevel_249 Bool)
  (temp___do_typ_inv_250 Bool)) Bool (=>
                                     (or (= temp___is_init_247 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_251)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant2 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant1 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__loop_types__lists__cursor__node count_type)))))
(define-fun us_split_fields_rec__loop_types__lists__cursor__node__projection ((a us_split_fields2)) count_type 
  (rec__loop_types__lists__cursor__node a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (= (to_rep
                            (rec__loop_types__lists__cursor__node
                            (us_split_fields3 a))) (to_rep
                                                   (rec__loop_types__lists__cursor__node
                                                   (us_split_fields3 b))))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

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

(declare-fun user_eq6 (us_rep2 us_rep2) Bool)

(declare-const dummy6 us_rep2)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep2)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep2 
  (cursor__content a))

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

(declare-fun user_eq7 (us_rep3 us_rep3) Bool)

(declare-const dummy7 us_rep3)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content us_rep3)))))
(define-fun map__ref_map__content__projection ((a map__ref)) us_rep3 
  (map__content a))

(declare-datatypes ((key_type__ref 0))
(((key_type__refqtmk (key_type__content us_rep2)))))
(define-fun key_type__ref_key_type__content__projection ((a key_type__ref)) us_rep2 
  (key_type__content a))

(declare-fun get1 (us_rep3 us_rep2) Int)

(declare-fun get__function_guard1 (Int us_rep3 us_rep2) Bool)

(declare-fun has_key (us_rep3 us_rep2) Bool)

(declare-fun has_key__function_guard (Bool us_rep3 us_rep2) Bool)

(declare-fun witness (us_rep3 us_rep2) Int)

(declare-fun witness__function_guard (Int us_rep3 us_rep2) Bool)

(declare-fun w_get (us_rep3 Int) Int)

(declare-fun w_get__function_guard (Int us_rep3 Int) Bool)

(declare-fun oeq (us_rep3 us_rep3) Bool)

(declare-fun oeq__function_guard (Bool us_rep3 us_rep3) Bool)

(declare-fun is_empty (us_rep3) Bool)

(declare-fun is_empty__function_guard (Bool us_rep3) Bool)

(declare-fun length2 (us_rep3) Int)

(declare-fun length__function_guard2 (Int us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq7 a b) (oeq a b)) :pattern ((user_eq7 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_268 us_rep3)
  (temp___skip_top_level_269 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_269 true))
                                         (and
                                         (= (is_empty temp___expr_268) true)
                                         (= (length2 temp___expr_268) 0))))

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 1 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq8 (element_type1 element_type1) Bool)

(declare-const dummy8 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant3 ((temp___expr_293 Int)
  (temp___is_init_289 Bool) (temp___skip_constant_290 Bool)
  (temp___do_toplevel_291 Bool)
  (temp___do_typ_inv_292 Bool)) Bool (=>
                                     (or (= temp___is_init_289 true)
                                     (<= 1 2147483647)) (in_range5
                                     temp___expr_293)))

(define-fun default_initial_assumption2 ((temp___expr_276 us_rep2)
  (temp___skip_top_level_277 Bool)) Bool (= (to_rep
                                            (rec__loop_types__lists__cursor__node
                                            (us_split_fields3
                                            temp___expr_276))) 0))

;; get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((key us_rep2))
  (! (=> (= (has_key container key) true)
     (let ((result (get1 container key)))
     (and
     (=> (= (distinct 0 0) true)
     (and (= result (w_get container (witness container key)))
     (forall ((k us_rep2))
     (=> (= (has_key container k) true)
     (= (= (bool_eq2 k key) true)
     (= (witness container key) (witness container k)))))))
     (dynamic_invariant3 result true false true true)))) :pattern ((get1
                                                                   container
                                                                   key)) ))))

(declare-fun positions (us_rep) us_rep3)

(declare-fun positions__function_guard (us_rep3 us_rep) Bool)

(declare-const no_element us_rep2)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

;; positions__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (positions container)))
     (and (not (= (has_key result no_element) true))
     (forall ((i us_rep2))
     (=> (= (has_key result i) true)
     (and
     (let ((temp___304 (get1 result i)))
     (and (<= 1 temp___304) (<= temp___304 (length container))))
     (forall ((j us_rep2))
     (=> (= (has_key result j) true)
     (=> (= (get1 result i) (get1 result j)) (= (bool_eq2 i j) true))))))))) :pattern (
  (positions container)) )))

(define-fun has_element ((container us_rep)
  (position us_rep2)) Bool (has_key (positions container) position))

(declare-fun has_element__function_guard (Bool us_rep us_rep2) Bool)

(define-fun length3 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-fun first (us_rep) us_rep2)

(declare-fun first__function_guard (us_rep2 us_rep) Bool)

(define-fun default_initial_assumption3 ((temp___expr_261 us_rep2)
  (temp___skip_top_level_262 Bool)) Bool (= (to_rep
                                            (rec__loop_types__lists__cursor__node
                                            (us_split_fields3
                                            temp___expr_261))) 0))

;; first__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (first container)))
     (ite (= (length container) 0) (= (bool_eq2 result no_element) true)
     (and (= (has_element container result) true)
     (= (get1 (positions container) result) 1)))) :pattern ((first container)) )))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun element ((container us_rep)
  (position us_rep2)) Int (get (model1 container)
                          (get1 (positions container) position)))

(declare-fun element__function_guard (Int us_rep us_rep2) Bool)

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 0 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq9 (element_type2 element_type2) Bool)

(declare-const dummy9 element_type2)

(declare-datatypes ((element_type__ref2 0))
(((element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(define-fun dynamic_invariant4 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_215)))

(define-fun equal_except ((left us_rep1) (right us_rep1)
  (position Int)) Bool (and (= (length1 left) (length1 right)) (ite (forall
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
                                                                    (get left
                                                                    i) 
                                                                    (get
                                                                    right i)))))
                                                               true false)))

(declare-fun equal_except__function_guard (Bool us_rep1 us_rep1 Int) Bool)

(declare-sort component_t 0)

(declare-fun component_tqtint (component_t) Int)

;; component_t'axiom
  (assert
  (forall ((i component_t))
  (and (<= 0 (component_tqtint i)) (<= (component_tqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq10 (component_t component_t) Bool)

(declare-const dummy10 component_t)

(declare-datatypes ((component_t__ref 0))
(((component_t__refqtmk (component_t__content component_t)))))
(define-fun component_t__ref_component_t__content__projection ((a component_t__ref)) component_t 
  (component_t__content a))

(define-fun dynamic_invariant5 ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_206)))

(declare-const rliteral count_type)

;; rliteral_axiom
  (assert (= (count_typeqtint rliteral) 0))

;; no_element__def_axiom
  (assert (= no_element (us_repqtmk1 (us_split_fieldsqtmk1 rliteral))))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant result true false
     true true))) :pattern ((length1 container)) )))

;; has_key__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((key us_rep2))
  (! (=> (= (distinct 0 0) true)
     (=>
     (exists ((k us_rep2))
     (and (= (has_key container k) true) (= (bool_eq2 k key) true)))
     (= (has_key container key) true))) :pattern ((has_key container key)) ))))

;; length__post_axiom
  (assert
  (forall ((container us_rep3)) (! (dynamic_invariant (length2 container)
  true false true true) :pattern ((length2 container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep3) (right us_rep3))
  (! (= (= (oeq left right) true)
     (and
     (forall ((key us_rep2))
     (=> (= (has_key left key) true)
     (and (= (has_key right key) true) (= (get1 right key) (get1 left key)))))
     (forall ((key us_rep2))
     (=> (= (has_key right key) true) (= (has_key left key) true))))) :pattern (
  (oeq left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep3))
  (! (= (= (is_empty container) true)
     (forall ((key us_rep2)) (not (= (has_key container key) true)))) :pattern (
  (is_empty container)) )))

(declare-fun has_witness (us_rep3 Int) Bool)

(declare-fun has_witness__function_guard (Bool us_rep3 Int) Bool)

;; has_witness__post_axiom
  (assert true)

;; witness__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((key us_rep2))
  (! (=> (= (has_key container key) true)
     (let ((result (witness container key)))
     (and (= (has_witness container result) true) (dynamic_invariant result
     true false true true)))) :pattern ((witness container key)) ))))

;; w_get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((witness1 Int))
  (! (=>
     (and (dynamic_invariant witness1 true true true true)
     (= (has_witness container witness1) true)) (dynamic_invariant3
     (w_get container witness1) true false true true)) :pattern ((w_get
                                                                 container
                                                                 witness1)) ))))

(assert
;; defqtvc
 ;; File "update_list_zero.adb", line 5, characters 0-0
  (not
  (forall ((l__split_fields us_main_type))
  (=> (dynamic_invariant5 threshold true false true true)
  (let ((usf (us_repqtmk l__split_discrs
             (us_split_fieldsqtmk l__split_fields))))
  (let ((o (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields))))
  (let ((update_list_zero__cu__assume (first o)))
  (=>
  (ite (= (= (length o) 0) true)
  (= (bool_eq2 update_list_zero__cu__assume no_element) true)
  (and (= (has_element o update_list_zero__cu__assume) true)
  (= (get1 (positions o) update_list_zero__cu__assume) 1)))
  (forall ((cu__split_fields count_type))
  (=>
  (= (us_split_fieldsqtmk1 cu__split_fields) (us_split_fields3
                                             update_list_zero__cu__assume))
  (forall ((l__split_fields1 us_main_type))
  (=>
  (let ((o1 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields))))
  (let ((o2 (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields))))
  (let ((o3 (has_element o2 o1)))
  (and (= (= o3 true) (= (has_key (positions o2) o1) true))
  (ite (= o3 true)
  (exists ((temp___loop_entry_335 us_rep))
  (and
  (= temp___loop_entry_335 (us_repqtmk l__split_discrs
                           (us_split_fieldsqtmk l__split_fields)))
  (exists ((temp___loop_entry_333 us_rep))
  (and
  (= temp___loop_entry_333 (us_repqtmk l__split_discrs
                           (us_split_fieldsqtmk l__split_fields)))
  (let ((o4 (length
            (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields)))))
  (and
  (and (dynamic_invariant o4 true false true true)
  (<= o4 (to_rep (rec__loop_types__lists__list__capacity l__split_discrs))))
  (exists ((l__split_fields2 us_main_type) (cu__split_fields1 count_type))
  (and
  (and
  (= (length
     (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields2))) 
  (length (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields))))
  (and
  (forall ((i Int))
  (=>
  (and (<= 1 i)
  (<= i (- (get1
           (positions
           (us_repqtmk l__split_discrs
           (us_split_fieldsqtmk l__split_fields2)))
           (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))) 1)))
  (= (get
     (model1
     (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields2))) i) 
  (ite (<= (get
           (model1
           (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields)))
           i) threshold)
  0 (get (model1 temp___loop_entry_335) i)))))
  (forall ((i Int))
  (=>
  (and
  (<= (get1
      (positions
      (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields2)))
      (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))) i)
  (<= i (length
        (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields2)))))
  (= (get
     (model1
     (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields2))) i) 
  (get (model1 temp___loop_entry_333) i))))))
  (and
  (= (and (ite true true false) (ite (= (has_element
                                        (us_repqtmk l__split_discrs
                                        (us_split_fieldsqtmk
                                        l__split_fields2))
                                        (us_repqtmk1
                                        (us_split_fieldsqtmk1
                                        cu__split_fields1))) true)
                                true false)) true)
  (and
  (let ((o5 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))))
  (let ((o6 (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields2))))
  (let ((o7 (element o6 o5)))
  (and
  (and (dynamic_invariant4 o7 true false true true)
  (= o7 (get (model1 o6) (get1 (positions o6) o5))))
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (<= o7 threshold) true false))
  (ite (= spark__branch true)
  (let ((o8 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))))
  (let ((o9 l__split_discrs))
  (exists
  ((loop_types__lists__replace_element__container__fields us_main_type))
  (and
  (and
  (and
  (and
  (= (length
     (us_repqtmk o9
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields))) (length
                                                              (us_repqtmk o9
                                                              (us_split_fieldsqtmk
                                                              l__split_fields2))))
  (= (oeq (positions (us_repqtmk o9 (us_split_fieldsqtmk l__split_fields2)))
     (positions
     (us_repqtmk o9
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields)))) true))
  (= (get
     (model1
     (us_repqtmk o9
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields)))
     (get1
     (positions
     (us_repqtmk o9
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields))) o8)) 0))
  (= (equal_except
     (model1 (us_repqtmk o9 (us_split_fieldsqtmk l__split_fields2)))
     (model1
     (us_repqtmk o9
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields)))
     (get1
     (positions
     (us_repqtmk o9
     (us_split_fieldsqtmk
     loop_types__lists__replace_element__container__fields))) o8)) true))
  (= l__split_fields1 loop_types__lists__replace_element__container__fields)))))
  (= l__split_fields1 l__split_fields2))))))))
  (let ((o5 (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields1))))
  (exists ((cu__split_fields2 count_type))
  (and
  (ite (= (or (bool_eq2
              (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields1))
              no_element) (= (get1 (positions o5)
                             (us_repqtmk1
                             (us_split_fieldsqtmk1 cu__split_fields1))) 
  (length o5))) true)
  (= (bool_eq2 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields2))
     no_element) true)
  (and
  (= (has_element o5 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields2))) true)
  (= (get1 (positions o5)
     (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields2))) (+ (get1
                                                                (positions
                                                                o5)
                                                                (us_repqtmk1
                                                                (us_split_fieldsqtmk1
                                                                cu__split_fields1))) 1))))
  (let ((o6 (us_repqtmk1 (us_split_fieldsqtmk1 cu__split_fields2))))
  (let ((o7 (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields1))))
  (let ((o8 (has_element o7 o6)))
  (and (= (= o8 true) (= (has_key (positions o7) o6) true))
  (not (= o8 true))))))))))))))))))) (= l__split_fields1 l__split_fields))))))
  (forall ((usf1 Int))
  (let ((o1 (length
            (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields1)))))
  (=>
  (and (dynamic_invariant o1 true false true true)
  (<= o1 (to_rep (rec__loop_types__lists__list__capacity l__split_discrs))))
  (=>
  (= (and (ite (<= 1 usf1) true false) (ite (<= usf1 o1) true false)) true)
  (let ((o2 (get
            (model1
            (us_repqtmk l__split_discrs
            (us_split_fieldsqtmk l__split_fields))) usf1)))
  (=> (dynamic_invariant1 o2 true false true true)
  (=> (not (<= o2 threshold))
  (=> (= (length1 (model1 usf)) (length usf)) (<= 1 usf1)))))))))))))))))))))
(check-sat)
(exit)
