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

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 1000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (capacity_range capacity_range) Bool)

(declare-const dummy capacity_range)

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
  (forall ((x capacity_range)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__loop_types__vectors__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__loop_types__vectors__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__loop_types__vectors__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__loop_types__vectors__vector us_main_type)))))
(define-fun us_split_fields_rec__loop_types__vectors__vector__projection ((a us_split_fields)) us_main_type 
  (rec__loop_types__vectors__vector a))

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
                           (rec__loop_types__vectors__vector__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__loop_types__vectors__vector__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__loop_types__vectors__vector
                           (us_split_fields1 a))
                           (rec__loop_types__vectors__vector
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

(declare-const loop_types__vectors__vector__capacity__first__bit Int)

(declare-const loop_types__vectors__vector__capacity__last__bit Int)

(declare-const loop_types__vectors__vector__capacity__position Int)

;; loop_types__vectors__vector__capacity__first__bit_axiom
  (assert (<= 0 loop_types__vectors__vector__capacity__first__bit))

;; loop_types__vectors__vector__capacity__last__bit_axiom
  (assert
  (< loop_types__vectors__vector__capacity__first__bit loop_types__vectors__vector__capacity__last__bit))

;; loop_types__vectors__vector__capacity__position_axiom
  (assert (<= 0 loop_types__vectors__vector__capacity__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((vec_t__ref 0))
(((vec_t__refqtmk (vec_t__content us_rep)))))
(define-fun vec_t__ref_vec_t__content__projection ((a vec_t__ref)) us_rep 
  (vec_t__content a))

(define-fun in_range2 ((rec__loop_types__vectors__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__loop_types__vectors__vector__capacity1 
  (to_rep (rec__loop_types__vectors__vector__capacity a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const loop_types__vectors__vector__capacity__first__bit1 Int)

(declare-const loop_types__vectors__vector__capacity__last__bit1 Int)

(declare-const loop_types__vectors__vector__capacity__position1 Int)

;; loop_types__vectors__vector__capacity__first__bit_axiom
  (assert (<= 0 loop_types__vectors__vector__capacity__first__bit1))

;; loop_types__vectors__vector__capacity__last__bit_axiom
  (assert
  (< loop_types__vectors__vector__capacity__first__bit1 loop_types__vectors__vector__capacity__last__bit1))

;; loop_types__vectors__vector__capacity__position_axiom
  (assert (<= 0 loop_types__vectors__vector__capacity__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep 
  (vector__content a))

(declare-const v__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun first_index__function_guard (Int us_rep) Bool)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 1000))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (index_type index_type) Bool)

(declare-const dummy3 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant ((temp___expr_207 Int)
  (temp___is_init_203 Bool) (temp___skip_constant_204 Bool)
  (temp___do_toplevel_205 Bool)
  (temp___do_typ_inv_206 Bool)) Bool (=>
                                     (or (= temp___is_init_203 true)
                                     (<= 1 1000)) (in_range3
                                     temp___expr_207)))

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

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun length (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length container)))

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

(declare-fun user_eq5 (extended_index extended_index) Bool)

(declare-const dummy5 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_216 Int)
  (temp___is_init_212 Bool) (temp___skip_constant_213 Bool)
  (temp___do_toplevel_214 Bool)
  (temp___do_typ_inv_215 Bool)) Bool (=>
                                     (or (= temp___is_init_212 true)
                                     (<= 0 1001)) (in_range4
                                     temp___expr_216)))

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(define-fun element ((container us_rep)
  (index Int)) Int (get (model1 container) index))

(declare-fun element__function_guard (Int us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 0 (element_typeqtint i)) (<= (element_typeqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (element_type element_type) Bool)

(declare-const dummy6 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_256 Int)
  (temp___is_init_252 Bool) (temp___skip_constant_253 Bool)
  (temp___do_toplevel_254 Bool)
  (temp___do_typ_inv_255 Bool)) Bool (=>
                                     (or (= temp___is_init_252 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_256)))

(declare-const r4b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r5b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun length1 (us_rep) Int)

(declare-fun length__function_guard1 (Int us_rep) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun equal_except ((left us_rep1) (right us_rep1)
  (position Int)) Bool (and (= (length left) (length right)) (ite (forall
                                                                  ((i Int))
                                                                  (=>
                                                                  (and
                                                                  (<= 1 i)
                                                                  (<= i 
                                                                  (last left)))
                                                                  (=>
                                                                  (not
                                                                  (= i position))
                                                                  (= 
                                                                  (get left
                                                                  i) 
                                                                  (get right
                                                                  i)))))
                                                             true false)))

(declare-fun equal_except__function_guard (Bool us_rep1 us_rep1 Int) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (integer integer) Bool)

(declare-const dummy7 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range6 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range6 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content integer)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) integer 
  (t6b__content a))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range6 temp___expr_18)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (count_type count_type) Bool)

(declare-const dummy9 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant4 ((temp___expr_174 Int)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_174)))

(define-fun dynamic_invariant5 ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= 0 1000)) (in_range1
                                     temp___expr_181)))

(define-fun capacity ((container us_rep)) Int (to_rep
                                              (rec__loop_types__vectors__vector__capacity
                                              (us_split_discrs1 container))))

(declare-fun capacity__function_guard (Int us_rep) Bool)

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length1 container)))
     (and (<= result (capacity container)) (dynamic_invariant5 result true
     false true true))) :pattern ((length1 container)) )))

(define-fun default_initial_assumption ((temp___expr_231 us_rep1)
  (temp___skip_top_level_232 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_232 true))
                                         (= (length temp___expr_231) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length (model1 container)) (length1 container)) :pattern ((model1
                                                                   container)) )))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= 0 (extended_indexqtint1 i)) (<= (extended_indexqtint1 i) 1000))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq10 (extended_index1 extended_index1) Bool)

(declare-const dummy10 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_223 Int)
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (=>
                                     (or (= temp___is_init_219 true)
                                     (<= 0 1000)) (in_range8
                                     temp___expr_223)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length container)))
     (and (<= (+ 0 result) 1000) (dynamic_invariant4 result true false true
     true))) :pattern ((length container)) )))

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 0 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq11 (element_type1 element_type1) Bool)

(declare-const dummy11 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant7 ((temp___expr_263 Int)
  (temp___is_init_259 Bool) (temp___skip_constant_260 Bool)
  (temp___do_toplevel_261 Bool)
  (temp___do_typ_inv_262 Bool)) Bool (=>
                                     (or (= temp___is_init_259 true)
                                     (<= 0 2147483647)) (in_range9
                                     temp___expr_263)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant6 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant7 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(assert
;; defqtvc
 ;; File "init_vec_zero.adb", line 3, characters 0-0
  (not
  (forall ((v__split_fields us_main_type))
  (=> (and (dynamic_invariant 1 true false true true) (= 1 1))
  (=> (= 1 r4b)
  (=> (dynamic_invariant r4b true false true true)
  (let ((o (us_repqtmk v__split_discrs (us_split_fieldsqtmk v__split_fields))))
  (let ((init_vec_zero__L_1__R5b__assume (last_index o)))
  (=>
  (and (dynamic_invariant1 init_vec_zero__L_1__R5b__assume true false true
  true) (= init_vec_zero__L_1__R5b__assume (last (model1 o))))
  (=> (= init_vec_zero__L_1__R5b__assume r5b)
  (=> (dynamic_invariant1 r5b true false true true)
  (let ((temp___276 r4b))
  (forall ((j Int))
  (=> (= j temp___276)
  (=>
  (= (and (ite (<= temp___276 j) true false) (ite (<= j r5b) true false)) true)
  (=> (in_range3 j)
  (let ((o1 v__split_discrs))
  (forall
  ((loop_types__vectors__replace_element__container__fields us_main_type))
  (=>
  (and
  (and
  (= (length1
     (us_repqtmk o1
     (us_split_fieldsqtmk
     loop_types__vectors__replace_element__container__fields))) (length1
                                                                (us_repqtmk
                                                                o1
                                                                (us_split_fieldsqtmk
                                                                v__split_fields))))
  (= (get
     (model1
     (us_repqtmk o1
     (us_split_fieldsqtmk
     loop_types__vectors__replace_element__container__fields))) j) 0))
  (= (equal_except
     (model1 (us_repqtmk o1 (us_split_fieldsqtmk v__split_fields)))
     (model1
     (us_repqtmk o1
     (us_split_fieldsqtmk
     loop_types__vectors__replace_element__container__fields))) j) true))
  (forall ((v__split_fields1 us_main_type))
  (=>
  (= v__split_fields1 loop_types__vectors__replace_element__container__fields)
  (let ((o2 (us_repqtmk v__split_discrs
            (us_split_fieldsqtmk v__split_fields1))))
  (let ((o3 (last_index o2)))
  (=>
  (and (dynamic_invariant1 o3 true false true true)
  (= o3 (last (model1 o2))))
  (=>
  (= (last_index
     (us_repqtmk v__split_discrs (us_split_fieldsqtmk v__split_fields1))) 
  (last_index
  (us_repqtmk v__split_discrs (us_split_fieldsqtmk v__split_fields))))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k j))
  (= (element
     (us_repqtmk v__split_discrs (us_split_fieldsqtmk v__split_fields1)) k) 0))))))))))))))))))))))))))))
(check-sat)
(exit)
