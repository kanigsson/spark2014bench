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

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i))
  (<= (capacity_rangeqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (capacity_range capacity_range) Bool)

(declare-const dummy capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(declare-sort capacity_range1 0)

(declare-fun capacity_rangeqtint1 (capacity_range1) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range1))
  (and (<= 0 (capacity_rangeqtint1 i))
  (<= (capacity_rangeqtint1 i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (capacity_range1 capacity_range1) Bool)

(declare-const dummy1 capacity_range1)

(declare-datatypes ((capacity_range__ref1 0))
(((capacity_range__refqtmk1 (capacity_range__content1 capacity_range1)))))
(define-fun capacity_range__ref_capacity_range__content__2__projection ((a capacity_range__ref1)) capacity_range1 
  (capacity_range__content1 a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity capacity_range1)))))
(define-fun us_split_discrs_rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__projection ((a us_split_discrs)) capacity_range1 
  (rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity
  a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector us_main_type)))))
(define-fun us_split_fields_rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__projection ((a us_split_fields)) us_main_type 
  (rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector a))

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

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__last__bit Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__position Int)

;; ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit))

;; ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__last__bit_axiom
  (assert
  (< ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit 
  ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__last__bit))

;; ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__position_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t172s__ref 0))
(((t172s__refqtmk (t172s__content us_rep)))))
(define-fun t172s__ref_t172s__content__projection ((a t172s__ref)) us_rep 
  (t172s__content a))

(declare-datatypes ((us_split_discrs2 0))
(((us_split_discrsqtmk1
  (rec__ada___hnco__test2__v_type_owner__vector_type__capacity capacity_range)))))
(define-fun us_split_discrs_rec__ada___hnco__test2__v_type_owner__vector_type__capacity__projection ((a us_split_discrs2)) capacity_range 
  (rec__ada___hnco__test2__v_type_owner__vector_type__capacity a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__ada___hnco__test2__v_type_owner__vector_type__hidden_vector us_rep)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__ada___hnco__test2__v_type_owner__vector_type__hidden_vector__projection ((a us_split_fields2)) us_rep 
  (rec__ada___hnco__test2__v_type_owner__vector_type__hidden_vector a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields2)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs3 us_split_discrs2)(us_split_fields3 us_split_fields2)(attr__tag Int)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__projection ((a us_rep1)) Int (attr__tag a))

(declare-fun us_dispatch_eq (us_rep1 us_rep1) Bool)

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const us_tag Int)

(define-fun in_range2 ((rec__ada___hnco__test2__v_type_owner__vector_type__capacity1 Int)
  (a us_split_discrs2)) Bool (= rec__ada___hnco__test2__v_type_owner__vector_type__capacity1 
  (to_rep (rec__ada___hnco__test2__v_type_owner__vector_type__capacity a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const ada___hnco__test2__v_type_owner__vector_type__capacity__first__bit Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type__capacity__last__bit Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type__capacity__position Int)

;; ada___hnco__test2__v_type_owner__vector_type__capacity__first__bit_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type__capacity__first__bit))

;; ada___hnco__test2__v_type_owner__vector_type__capacity__last__bit_axiom
  (assert
  (< ada___hnco__test2__v_type_owner__vector_type__capacity__first__bit 
  ada___hnco__test2__v_type_owner__vector_type__capacity__last__bit))

;; ada___hnco__test2__v_type_owner__vector_type__capacity__position_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type__capacity__position))

(declare-const ada___hnco__test2__v_type_owner__vector_type__hidden_vector__first__bit Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type__hidden_vector__last__bit Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type__hidden_vector__position Int)

;; ada___hnco__test2__v_type_owner__vector_type__hidden_vector__first__bit_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type__hidden_vector__first__bit))

;; ada___hnco__test2__v_type_owner__vector_type__hidden_vector__last__bit_axiom
  (assert
  (< ada___hnco__test2__v_type_owner__vector_type__hidden_vector__first__bit 
  ada___hnco__test2__v_type_owner__vector_type__hidden_vector__last__bit))

;; ada___hnco__test2__v_type_owner__vector_type__hidden_vector__position_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type__hidden_vector__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((vector_type__ref 0))
(((vector_type__refqtmk (vector_type__content us_rep1)))))
(define-fun vector_type__ref_vector_type__content__projection ((a vector_type__ref)) us_rep1 
  (vector_type__content a))

(declare-const container us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x capacity_range1)) Int (capacity_rangeqtint1 x))

(declare-fun of_rep1 (Int) capacity_range1)

;; inversion_axiom
  (assert
  (forall ((x capacity_range1))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range1)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun in_range3 ((rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity1 
  (to_rep1
  (rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity
  a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit1 Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__last__bit1 Int)

(declare-const ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__position1 Int)

;; ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit1))

;; ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__last__bit_axiom
  (assert
  (< ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__first__bit1 
  ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__last__bit1))

;; ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__position_axiom
  (assert
  (<= 0 ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity__position1))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep 
  (vector__content a))

(define-fun dynamic_invariant ((temp___expr_308 us_rep1)
  (temp___is_init_304 Bool) (temp___skip_constant_305 Bool)
  (temp___do_toplevel_306 Bool) (temp___do_typ_inv_307 Bool)) Bool (in_range3
  (to_rep
  (rec__ada___hnco__test2__v_type_owner__vector_type__capacity
  (us_split_discrs3 temp___expr_308)))
  (us_split_discrs1
  (rec__ada___hnco__test2__v_type_owner__vector_type__hidden_vector
  (us_split_fields3 temp___expr_308)))))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq5 (count_type count_type) Bool)

(declare-const dummy5 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_238 Int)
  (temp___is_init_234 Bool) (temp___skip_constant_235 Bool)
  (temp___do_toplevel_236 Bool)
  (temp___do_typ_inv_237 Bool)) Bool (=>
                                     (or (= temp___is_init_234 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_238)))

(define-fun dynamic_invariant2 ((temp___expr_245 Int)
  (temp___is_init_241 Bool) (temp___skip_constant_242 Bool)
  (temp___do_toplevel_243 Bool)
  (temp___do_typ_inv_244 Bool)) Bool (=>
                                     (or (= temp___is_init_241 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_245)))

(define-fun dynamic_invariant3 ((temp___expr_252 Int)
  (temp___is_init_248 Bool) (temp___skip_constant_249 Bool)
  (temp___do_toplevel_250 Bool)
  (temp___do_typ_inv_251 Bool)) Bool (=>
                                     (or (= temp___is_init_248 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_252)))

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq4 a b) (oeq a b)) :pattern ((user_eq4 a b)) )))

(define-fun in_range5 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(define-fun capacity ((container1 us_rep)) Int (ite (= (distinct 1 0) true)
                                               (to_rep1
                                               (rec__ada___hnco__test2__v_type_owner__vector_type_owner__vector__capacity
                                               (us_split_discrs1 container1)))
                                               2147483647))

(declare-fun capacity__function_guard (Int us_rep) Bool)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

;; length__post_axiom
  (assert
  (forall ((container1 us_rep))
  (! (let ((result (length container1)))
     (and (<= result (capacity container1)) (dynamic_invariant3 result true
     false true true))) :pattern ((length container1)) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq (us_rep2 us_rep2) Bool)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq6 (us_rep2 us_rep2) Bool)

(declare-const dummy6 us_rep2)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep2)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep2 
  (sequence__content a))

(declare-fun length1 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(declare-fun model1 (us_rep) us_rep2)

(declare-fun model__function_guard (us_rep2 us_rep) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun last ((container1 us_rep2)) Int (+ 0 (length1 container1)))

(declare-fun last__function_guard (Int us_rep2) Bool)

(declare-fun get (us_rep2 Int) Int)

(declare-fun get__function_guard (Int us_rep2 Int) Bool)

(define-fun oeq1 ((left us_rep2)
  (right us_rep2)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get left
                                                                   n) 
                                                                (get right n))))
                                                                true false)))

(declare-fun oeq__function_guard1 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq6 a b) (oeq1 a b)) :pattern ((user_eq6 a b)) )))

(define-fun default_initial_assumption ((temp___expr_266 us_rep2)
  (temp___skip_top_level_267 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_267 true))
                                         (= (length1 temp___expr_266) 0)))

;; model__post_axiom
  (assert
  (forall ((container1 us_rep))
  (! (= (length1 (model1 container1)) (length container1)) :pattern (
  (model1 container1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (extended_index extended_index) Bool)

(declare-const dummy7 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant4 ((temp___expr_287 Int)
  (temp___is_init_283 Bool) (temp___skip_constant_284 Bool)
  (temp___do_toplevel_285 Bool)
  (temp___do_typ_inv_286 Bool)) Bool (=>
                                     (or (= temp___is_init_283 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_287)))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (! (let ((result (length1 container1)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant1 result true false
     true true))) :pattern ((length1 container1)) )))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (element_type element_type) Bool)

(declare-const dummy8 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant5 ((temp___expr_301 Int)
  (temp___is_init_297 Bool) (temp___skip_constant_298 Bool)
  (temp___do_toplevel_299 Bool)
  (temp___do_typ_inv_300 Bool)) Bool (=>
                                     (or (= temp___is_init_297 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range7 temp___expr_301)))

;; get__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant4 position true true true true)
     (and (<= 1 position) (<= position (last container1))))
     (dynamic_invariant5 (get container1 position) true false true true)) :pattern (
  (get container1 position)) ))))

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(assert
;; defqtvc
 ;; File "aida-containers-formal_vectors.ads", line 47, characters 0-0
  (not
  (forall ((o Int) (ada___hnco__test2__v_type_owner__capacity__result Int))
  (=> (dynamic_invariant container true false true true)
  (=>
  (= (to_rep
     (rec__ada___hnco__test2__v_type_owner__vector_type__capacity
     (us_split_discrs3 container))) o)
  (=> (= ada___hnco__test2__v_type_owner__capacity__result o)
  (<= (to_rep
      (rec__ada___hnco__test2__v_type_owner__vector_type__capacity
      (us_split_discrs3 container))) ada___hnco__test2__v_type_owner__capacity__result)))))))
(check-sat)
(exit)
