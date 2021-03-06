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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort pointer_type 0)

(declare-fun pointer_typeqtint (pointer_type) Int)

;; pointer_type'axiom
  (assert
  (forall ((i pointer_type))
  (and (<= 0 (pointer_typeqtint i)) (<= (pointer_typeqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (pointer_type pointer_type) Bool)

(declare-const dummy1 pointer_type)

(declare-datatypes ((pointer_type__ref 0))
(((pointer_type__refqtmk (pointer_type__content pointer_type)))))
(define-fun pointer_type__ref_pointer_type__content__projection ((a pointer_type__ref)) pointer_type 
  (pointer_type__content a))

(define-fun to_rep1 ((x pointer_type)) Int (pointer_typeqtint x))

(declare-fun of_rep1 (Int) pointer_type)

;; inversion_axiom
  (assert
  (forall ((x pointer_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x pointer_type)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int integer))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq2 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stacks_1__stack_type__pointer pointer_type)(rec__stacks_1__stack_type__vector (Array Int integer))))))
(define-fun us_split_fields_rec__stacks_1__stack_type__pointer__projection ((a us_split_fields)) pointer_type 
  (rec__stacks_1__stack_type__pointer a))

(define-fun us_split_fields_rec__stacks_1__stack_type__vector__projection ((a us_split_fields)) (Array Int integer) 
  (rec__stacks_1__stack_type__vector a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__stacks_1__stack_type__pointer
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__stacks_1__stack_type__pointer
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__stacks_1__stack_type__vector
                           (us_split_fields1 a)) 1 100
                           (rec__stacks_1__stack_type__vector
                           (us_split_fields1 b)) 1 100) true))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const stacks_1__stack_type__pointer__first__bit Int)

(declare-const stacks_1__stack_type__pointer__last__bit Int)

(declare-const stacks_1__stack_type__pointer__position Int)

;; stacks_1__stack_type__pointer__first__bit_axiom
  (assert (<= 0 stacks_1__stack_type__pointer__first__bit))

;; stacks_1__stack_type__pointer__last__bit_axiom
  (assert
  (< stacks_1__stack_type__pointer__first__bit stacks_1__stack_type__pointer__last__bit))

;; stacks_1__stack_type__pointer__position_axiom
  (assert (<= 0 stacks_1__stack_type__pointer__position))

(declare-const stacks_1__stack_type__vector__first__bit Int)

(declare-const stacks_1__stack_type__vector__last__bit Int)

(declare-const stacks_1__stack_type__vector__position Int)

;; stacks_1__stack_type__vector__first__bit_axiom
  (assert (<= 0 stacks_1__stack_type__vector__first__bit))

;; stacks_1__stack_type__vector__last__bit_axiom
  (assert
  (< stacks_1__stack_type__vector__first__bit stacks_1__stack_type__vector__last__bit))

;; stacks_1__stack_type__vector__position_axiom
  (assert (<= 0 stacks_1__stack_type__vector__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((stack_type__ref 0))
(((stack_type__refqtmk (stack_type__content us_rep)))))
(define-fun stack_type__ref_stack_type__content__projection ((a stack_type__ref)) us_rep 
  (stack_type__content a))

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

(declare-fun temp_____aggregate_def_190 (Int) (Array Int integer))

(define-fun default_initial_assumption ((temp___expr_188 us_rep)
  (temp___skip_top_level_189 Bool)) Bool (and
                                         (= (to_rep1
                                            (rec__stacks_1__stack_type__pointer
                                            (us_split_fields1
                                            temp___expr_188))) 0)
                                         (= (rec__stacks_1__stack_type__vector
                                            (us_split_fields1
                                            temp___expr_188)) (temp_____aggregate_def_190
                                                              0))))

;; is_empty__post_axiom
  (assert true)

;; is_empty__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (= (is_empty s) true)
     (= (to_rep1 (rec__stacks_1__stack_type__pointer (us_split_fields1 s))) 0)) :pattern (
  (is_empty s)) )))

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (= (is_full s) true)
     (= (to_rep1 (rec__stacks_1__stack_type__pointer (us_split_fields1 s))) 100)) :pattern (
  (is_full s)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort stack_index 0)

(declare-fun stack_indexqtint (stack_index) Int)

;; stack_index'axiom
  (assert
  (forall ((i1 stack_index))
  (and (<= 1 (stack_indexqtint i1)) (<= (stack_indexqtint i1) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (stack_index stack_index) Bool)

(declare-const dummy4 stack_index)

(declare-datatypes ((stack_index__ref 0))
(((stack_index__refqtmk (stack_index__content stack_index)))))
(define-fun stack_index__ref_stack_index__content__projection ((a stack_index__ref)) stack_index 
  (stack_index__content a))

(declare-fun temp_____aggregate_def_200 ((Array Int integer) Int
  Int) (Array Int integer))

(define-fun dynamic_invariant1 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 1 100)) (in_range3 temp___expr_169)))

;; def_axiom
  (assert
  (forall ((temp___202 (Array Int integer)))
  (forall ((temp___203 Int) (temp___204 Int))
  (let ((temp___201 (temp_____aggregate_def_200 temp___202 temp___203
                    temp___204)))
  (=>
  (and (dynamic_invariant1 temp___203 true true true true) (dynamic_invariant
  temp___204 true true true true))
  (forall ((temp___205 Int))
  (ite (= temp___205 temp___203)
  (= (to_rep (select temp___201 temp___205)) temp___204)
  (= (select temp___201 temp___205) (select temp___202 temp___205)))))))))

(define-fun dynamic_invariant2 ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 0 100)) (in_range2 temp___expr_162)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___192 Int))
  (=> (dynamic_invariant temp___192 true true true true)
  (forall ((temp___193 Int))
  (= (select (temp_____aggregate_def_190 temp___192) temp___193) rliteral)))))

(assert
;; defqtvc
 ;; File "stacks_1.ads", line 12, characters 0-0
  (not
  (forall ((s__split_fields us_split_fields))
  (=> (dynamic_invariant i true false true true)
  (=>
  (forall ((s__split_fields1 us_split_fields)) (is_full__function_guard
  (is_full (us_repqtmk s__split_fields1)) (us_repqtmk s__split_fields1)))
  (=> (not (= (is_full (us_repqtmk s__split_fields)) true))
  (forall ((o Int))
  (=> (= (to_rep1 (rec__stacks_1__stack_type__pointer s__split_fields)) o)
  (let ((o1 (+ o 1)))
  (=> (in_range2 o1)
  (forall ((o2 pointer_type))
  (=> (= (to_rep1 o2) o1)
  (forall ((s__split_fields1 us_split_fields))
  (=>
  (= s__split_fields1 (us_split_fieldsqtmk o2
                      (rec__stacks_1__stack_type__vector s__split_fields)))
  (forall ((o3 integer))
  (=> (= (to_rep o3) i)
  (forall ((temp___228 Int))
  (=>
  (= (to_rep1 (rec__stacks_1__stack_type__pointer s__split_fields1)) temp___228)
  (=> (and (<= 1 temp___228) (<= temp___228 100))
  (forall ((s__split_fields2 us_split_fields))
  (=>
  (= s__split_fields2 (us_split_fieldsqtmk
                      (rec__stacks_1__stack_type__pointer s__split_fields1)
                      (store (rec__stacks_1__stack_type__vector
                             s__split_fields1) temp___228 o3)))
  (forall ((o4 Int))
  (=> (= (to_rep1 (rec__stacks_1__stack_type__pointer s__split_fields2)) o4)
  (in_range3 o4))))))))))))))))))))))))
(check-sat)
(exit)
