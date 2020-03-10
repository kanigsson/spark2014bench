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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 1000))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (capacity_range capacity_range) Bool)

(declare-const dummy1 capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range2
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__amortized_queue__my_vectors__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__amortized_queue__my_vectors__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__amortized_queue__my_vectors__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__amortized_queue__my_vectors__vector us_main_type)))))
(define-fun us_split_fields_rec__amortized_queue__my_vectors__vector__projection ((a us_split_fields)) us_main_type 
  (rec__amortized_queue__my_vectors__vector a))

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
                           (rec__amortized_queue__my_vectors__vector__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__amortized_queue__my_vectors__vector__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__amortized_queue__my_vectors__vector
                           (us_split_fields1 a))
                           (rec__amortized_queue__my_vectors__vector
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range3 ((rec__amortized_queue__my_vectors__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__amortized_queue__my_vectors__vector__capacity1 
  (to_rep (rec__amortized_queue__my_vectors__vector__capacity a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const amortized_queue__my_vectors__vector__capacity__first__bit Int)

(declare-const amortized_queue__my_vectors__vector__capacity__last__bit Int)

(declare-const amortized_queue__my_vectors__vector__capacity__position Int)

;; amortized_queue__my_vectors__vector__capacity__first__bit_axiom
  (assert (<= 0 amortized_queue__my_vectors__vector__capacity__first__bit))

;; amortized_queue__my_vectors__vector__capacity__last__bit_axiom
  (assert
  (< amortized_queue__my_vectors__vector__capacity__first__bit amortized_queue__my_vectors__vector__capacity__last__bit))

;; amortized_queue__my_vectors__vector__capacity__position_axiom
  (assert (<= 0 amortized_queue__my_vectors__vector__capacity__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep 
  (vector__content a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun capacity ((container us_rep)) Int (to_rep
                                              (rec__amortized_queue__my_vectors__vector__capacity
                                              (us_split_discrs1 container))))

(declare-fun capacity__function_guard (Int us_rep) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(define-fun dynamic_invariant ((temp___expr_255 Int)
  (temp___is_init_251 Bool) (temp___skip_constant_252 Bool)
  (temp___do_toplevel_253 Bool)
  (temp___do_typ_inv_254 Bool)) Bool (=>
                                     (or (= temp___is_init_251 true)
                                     (<= 0 1000)) (in_range2
                                     temp___expr_255)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= result (capacity container)) (dynamic_invariant result true
     false true true))) :pattern ((length container)) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

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

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

(define-fun last_index ((container us_rep)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep) Bool)

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 1001))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 1001)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (extended_index extended_index) Bool)

(declare-const dummy4 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_241 Int)
  (temp___is_init_237 Bool) (temp___skip_constant_238 Bool)
  (temp___do_toplevel_239 Bool)
  (temp___do_typ_inv_240 Bool)) Bool (=>
                                     (or (= temp___is_init_237 true)
                                     (<= 0 1001)) (in_range4
                                     temp___expr_241)))

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(define-fun element ((container us_rep)
  (index Int)) Int (get (model1 container) index))

(declare-fun element__function_guard (Int us_rep Int) Bool)

(declare-fun first_index__function_guard (Int us_rep) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_234 Int)
  (temp___is_init_230 Bool) (temp___skip_constant_231 Bool)
  (temp___do_toplevel_232 Bool)
  (temp___do_typ_inv_233 Bool)) Bool (=>
                                     (or (= temp___is_init_230 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_234)))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun olt ((left us_rep1)
  (right us_rep1)) Bool (and (< (length1 left) (length1 right)) (ite 
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

(declare-fun olt__function_guard (Bool us_rep1 us_rep1) Bool)

(declare-const left us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r2b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const amortized_queue__my_vectors__vector__capacity__first__bit1 Int)

(declare-const amortized_queue__my_vectors__vector__capacity__last__bit1 Int)

(declare-const amortized_queue__my_vectors__vector__capacity__position1 Int)

;; amortized_queue__my_vectors__vector__capacity__first__bit_axiom
  (assert (<= 0 amortized_queue__my_vectors__vector__capacity__first__bit1))

;; amortized_queue__my_vectors__vector__capacity__last__bit_axiom
  (assert
  (< amortized_queue__my_vectors__vector__capacity__first__bit1 amortized_queue__my_vectors__vector__capacity__last__bit1))

;; amortized_queue__my_vectors__vector__capacity__position_axiom
  (assert (<= 0 amortized_queue__my_vectors__vector__capacity__position1))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((tresultS__ref 0))
(((tresultS__refqtmk (tresultS__content us_rep)))))
(define-fun tresultS__ref_tresultS__content__projection ((a tresultS__ref)) us_rep 
  (tresultS__content a))

(declare-const result____split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq6 a b) (oeq a b)) :pattern ((user_eq6 a b)) )))

(define-fun dynamic_invariant3 ((temp___expr_497 us_rep)
  (temp___is_init_493 Bool) (temp___skip_constant_494 Bool)
  (temp___do_toplevel_495 Bool)
  (temp___do_typ_inv_496 Bool)) Bool (=>
                                     (not (= temp___skip_constant_494 true))
                                     (in_range3 r2b
                                     (us_split_discrs1 temp___expr_497))))

(define-fun default_initial_assumption ((temp___expr_499 us_rep)
  (temp___skip_top_level_500 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__amortized_queue__my_vectors__vector__capacity
                                            (us_split_discrs1
                                            temp___expr_499))) r2b)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_500 true))
                                         (= (is_empty temp___expr_499) true))))

(declare-const r4b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r10b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 1000))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (index_type index_type) Bool)

(declare-const dummy7 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy8 tcount_typeB)

(declare-datatypes ((tcount_typeB__ref 0))
(((tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (integer integer) Bool)

(declare-const dummy9 integer)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content integer)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) integer 
  (t5b__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq10 (integer integer) Bool)

(declare-const dummy10 integer)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content integer)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) integer 
  (t11b__content a))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq11 (count_type count_type) Bool)

(declare-const dummy11 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant5 ((temp___expr_248 Int)
  (temp___is_init_244 Bool) (temp___skip_constant_245 Bool)
  (temp___do_toplevel_246 Bool)
  (temp___do_typ_inv_247 Bool)) Bool (=>
                                     (or (= temp___is_init_244 true)
                                     (<= 0 2147483647)) (in_range8
                                     temp___expr_248)))

(define-fun oeq1 ((left1 us_rep1)
  (right1 us_rep1)) Bool (and (= (length1 left1) (length1 right1)) (ite 
                                                                   (forall
                                                                   ((n Int))
                                                                   (=>
                                                                   (and
                                                                   (<= 1 n)
                                                                   (<= n 
                                                                   (last
                                                                   left1)))
                                                                   (= 
                                                                   (get left1
                                                                   n) 
                                                                   (get
                                                                   right1 n))))
                                                                   true
                                                                   false)))

(declare-fun oeq__function_guard1 (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq3 a b) (oeq1 a b)) :pattern ((user_eq3 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_294 us_rep1)
  (temp___skip_top_level_295 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_295 true))
                                         (= (length1 temp___expr_294) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (= (= (oeq left1 right1) true)
     (= (oeq1 (model1 left1) (model1 right1)) true)) :pattern ((oeq left1
                                                               right1)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (= (is_empty container) true) (= (length container) 0)) :pattern (
  (is_empty container)) )))

(define-fun dynamic_invariant6 ((temp___expr_227 Int)
  (temp___is_init_223 Bool) (temp___skip_constant_224 Bool)
  (temp___do_toplevel_225 Bool)
  (temp___do_typ_inv_226 Bool)) Bool (=>
                                     (or (= temp___is_init_223 true)
                                     (<= 1 1000)) (in_range6
                                     temp___expr_227)))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= 0 (extended_indexqtint1 i)) (<= (extended_indexqtint1 i) 1000))))

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq12 (extended_index1 extended_index1) Bool)

(declare-const dummy12 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(define-fun dynamic_invariant7 ((temp___expr_286 Int)
  (temp___is_init_282 Bool) (temp___skip_constant_283 Bool)
  (temp___do_toplevel_284 Bool)
  (temp___do_typ_inv_285 Bool)) Bool (=>
                                     (or (= temp___is_init_282 true)
                                     (<= 0 1000)) (in_range9
                                     temp___expr_286)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 1000) (dynamic_invariant5 result true false true
     true))) :pattern ((length1 container)) )))

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= (- 2147483648) (element_typeqtint1 i))
  (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range10 ((x Int)) Bool (and (<= (- 2147483648) x)
                                      (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq13 (element_type1 element_type1) Bool)

(declare-const dummy13 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant8 ((temp___expr_279 Int)
  (temp___is_init_275 Bool) (temp___skip_constant_276 Bool)
  (temp___do_toplevel_277 Bool)
  (temp___do_typ_inv_278 Bool)) Bool (=>
                                     (or (= temp___is_init_275 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range10 temp___expr_279)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant7 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant8 (get container position) true false true true)) :pattern (
  (get container position)) ))))

;; r2b__def_axiom
  (assert (= r2b (+ (length left) (length right))))

;; r4b__def_axiom
  (assert (= r4b (last_index left)))

;; r10b__def_axiom
  (assert (= r10b (last_index right)))

(assert
;; defqtvc
 ;; File "amortized_queue.ads", line 14, characters 0-0
  (not
  (forall ((result____split_fields us_main_type))
  (=> (<= (+ (length left) (length right)) 1000)
  (let ((o right))
  (let ((o1 (length o)))
  (=> (and (dynamic_invariant o1 true false true true) (<= o1 (capacity o)))
  (let ((o2 left))
  (let ((o3 (length o2)))
  (=> (and (dynamic_invariant o3 true false true true) (<= o3 (capacity o2)))
  (=> (= (+ o3 o1) r2b)
  (=> (in_range7 r2b)
  (=> (in_range2 r2b)
  (=> (default_initial_assumption
  (us_repqtmk result____split_discrs
  (us_split_fieldsqtmk result____split_fields)) false)
  (=> (dynamic_invariant3
  (us_repqtmk result____split_discrs
  (us_split_fieldsqtmk result____split_fields)) false false true true)
  (let ((o4 left))
  (let ((amortized_queue__Oconcat__L_1__R4b__assume (last_index o4)))
  (=>
  (and (dynamic_invariant1 amortized_queue__Oconcat__L_1__R4b__assume true
  false true true)
  (= amortized_queue__Oconcat__L_1__R4b__assume (last (model1 o4))))
  (=> (= amortized_queue__Oconcat__L_1__R4b__assume r4b)
  (=> (dynamic_invariant1 r4b true false true true)
  (forall ((result____split_fields1 us_main_type))
  (=>
  (let ((temp___640 r4b))
  (exists ((idx Int))
  (and (= idx 1)
  (ite (= (and (ite (<= 1 idx) true false) (ite (<= idx temp___640) true
                                           false)) true)
  (and (in_range6 idx)
  (let ((o5 left))
  (let ((o6 (element o5 idx)))
  (and
  (and (dynamic_invariant2 o6 true false true true)
  (= o6 (get (model1 o5) idx)))
  (let ((o7 result____split_discrs))
  (exists
  ((amortized_queue__my_vectors__append__2__container__fields us_main_type))
  (and
  (and
  (and
  (= (length
     (us_repqtmk o7
     (us_split_fieldsqtmk
     amortized_queue__my_vectors__append__2__container__fields))) (+ 
  (length (us_repqtmk o7 (us_split_fieldsqtmk result____split_fields))) 1))
  (= (olt
     (model1 (us_repqtmk o7 (us_split_fieldsqtmk result____split_fields)))
     (model1
     (us_repqtmk o7
     (us_split_fieldsqtmk
     amortized_queue__my_vectors__append__2__container__fields)))) true))
  (= (get
     (model1
     (us_repqtmk o7
     (us_split_fieldsqtmk
     amortized_queue__my_vectors__append__2__container__fields)))
     (+ (last_index
        (us_repqtmk o7 (us_split_fieldsqtmk result____split_fields))) 1)) o6))
  (exists ((result____split_fields2 us_main_type))
  (and
  (= result____split_fields2 amortized_queue__my_vectors__append__2__container__fields)
  (let ((o8 (us_repqtmk result____split_discrs
            (us_split_fieldsqtmk result____split_fields2))))
  (let ((o9 (length o8)))
  (and
  (and (dynamic_invariant o9 true false true true) (<= o9 (capacity o8)))
  (exists ((idx1 Int))
  (and
  (and
  (= (length
     (us_repqtmk result____split_discrs
     (us_split_fieldsqtmk result____split_fields1))) idx1)
  (forall ((i Int))
  (=> (and (<= 1 i) (<= i idx1))
  (= (element
     (us_repqtmk result____split_discrs
     (us_split_fieldsqtmk result____split_fields1)) i) (element left i)))))
  (and
  (= (and (ite (and (dynamic_invariant3
               (us_repqtmk result____split_discrs
               (us_split_fieldsqtmk result____split_fields1)) false true true
               true) (dynamic_property 1 r4b idx1))
          true false) (ite (and (<= 1 idx1) (<= idx1 r4b)) true false)) true)
  (= idx1 temp___640))))))))))))))))
  (= result____split_fields1 result____split_fields)))))
  (= (length
     (us_repqtmk result____split_discrs
     (us_split_fieldsqtmk result____split_fields1))) (last_index left))))))))))))))))))))))))
(check-sat)
(exit)
