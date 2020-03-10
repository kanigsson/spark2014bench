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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__constrained_attribute__mut_rec__d integer)))))
(define-fun us_split_discrs_rec__constrained_attribute__mut_rec__d__projection ((a us_split_discrs)) integer 
  (rec__constrained_attribute__mut_rec__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__constrained_attribute__mut_rec__f integer)))))
(define-fun us_split_fields_rec__constrained_attribute__mut_rec__f__projection ((a us_split_fields)) integer 
  (rec__constrained_attribute__mut_rec__f a))

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
                           (rec__constrained_attribute__mut_rec__d
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__constrained_attribute__mut_rec__d
                                                  (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__constrained_attribute__mut_rec__f
                           (us_split_fields1 a))) (to_rep
                                                  (rec__constrained_attribute__mut_rec__f
                                                  (us_split_fields1 b)))))
                   true false))

(define-fun in_range1 ((rec__constrained_attribute__mut_rec__d1 Int)
  (a us_split_discrs)) Bool (= rec__constrained_attribute__mut_rec__d1 
  (to_rep (rec__constrained_attribute__mut_rec__d a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const constrained_attribute__mut_rec__d__first__bit Int)

(declare-const constrained_attribute__mut_rec__d__last__bit Int)

(declare-const constrained_attribute__mut_rec__d__position Int)

;; constrained_attribute__mut_rec__d__first__bit_axiom
  (assert (<= 0 constrained_attribute__mut_rec__d__first__bit))

;; constrained_attribute__mut_rec__d__last__bit_axiom
  (assert
  (< constrained_attribute__mut_rec__d__first__bit constrained_attribute__mut_rec__d__last__bit))

;; constrained_attribute__mut_rec__d__position_axiom
  (assert (<= 0 constrained_attribute__mut_rec__d__position))

(declare-const constrained_attribute__mut_rec__f__first__bit Int)

(declare-const constrained_attribute__mut_rec__f__last__bit Int)

(declare-const constrained_attribute__mut_rec__f__position Int)

;; constrained_attribute__mut_rec__f__first__bit_axiom
  (assert (<= 0 constrained_attribute__mut_rec__f__first__bit))

;; constrained_attribute__mut_rec__f__last__bit_axiom
  (assert
  (< constrained_attribute__mut_rec__f__first__bit constrained_attribute__mut_rec__f__last__bit))

;; constrained_attribute__mut_rec__f__position_axiom
  (assert (<= 0 constrained_attribute__mut_rec__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((mut_rec__ref 0))
(((mut_rec__refqtmk (mut_rec__content us_rep)))))
(define-fun mut_rec__ref_mut_rec__content__projection ((a mut_rec__ref)) us_rep 
  (mut_rec__content a))

(declare-fun is_constrained (us_rep) Bool)

(declare-fun is_constrained__function_guard (Bool us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_161 us_rep)
  (temp___skip_top_level_162 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__constrained_attribute__mut_rec__d
                                            (us_split_discrs1
                                            temp___expr_161))) 0)
                                         (= (to_rep
                                            (rec__constrained_attribute__mut_rec__f
                                            (us_split_fields1
                                            temp___expr_161))) 0)))

;; is_constrained__post_axiom
  (assert
  (forall ((r us_rep))
  (! (let ((result (is_constrained r)))
     (=> (is_constrained__function_guard result r) (= result true))) :pattern (
  (is_constrained r)) )))

;; is_constrained__def_axiom
  (assert
  (forall ((r us_rep))
  (! (= (is_constrained r) true) :pattern ((is_constrained r)) )))

(declare-const a__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const constrained_attribute__mut_rec__d__first__bit1 Int)

(declare-const constrained_attribute__mut_rec__d__last__bit1 Int)

(declare-const constrained_attribute__mut_rec__d__position1 Int)

;; constrained_attribute__mut_rec__d__first__bit_axiom
  (assert (<= 0 constrained_attribute__mut_rec__d__first__bit1))

;; constrained_attribute__mut_rec__d__last__bit_axiom
  (assert
  (< constrained_attribute__mut_rec__d__first__bit1 constrained_attribute__mut_rec__d__last__bit1))

;; constrained_attribute__mut_rec__d__position_axiom
  (assert (<= 0 constrained_attribute__mut_rec__d__position1))

(declare-const constrained_attribute__mut_rec__f__first__bit1 Int)

(declare-const constrained_attribute__mut_rec__f__last__bit1 Int)

(declare-const constrained_attribute__mut_rec__f__position1 Int)

;; constrained_attribute__mut_rec__f__first__bit_axiom
  (assert (<= 0 constrained_attribute__mut_rec__f__first__bit1))

;; constrained_attribute__mut_rec__f__last__bit_axiom
  (assert
  (< constrained_attribute__mut_rec__f__first__bit1 constrained_attribute__mut_rec__f__last__bit1))

;; constrained_attribute__mut_rec__f__position_axiom
  (assert (<= 0 constrained_attribute__mut_rec__f__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((tbS__ref 0))
(((tbS__refqtmk (tbS__content us_rep)))))
(define-fun tbS__ref_tbS__content__projection ((a tbS__ref)) us_rep (tbS__content
                                                                    a))

(declare-const b__split_discrs us_split_discrs)

(declare-const b__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_170 us_rep)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=>
                                     (not (= temp___skip_constant_167 true))
                                     (in_range1 0
                                     (us_split_discrs1 temp___expr_170))))

(define-fun default_initial_assumption1 ((temp___expr_172 us_rep)
  (temp___skip_top_level_173 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__constrained_attribute__mut_rec__d
                                            (us_split_discrs1
                                            temp___expr_172))) 0)
                                         (= (to_rep
                                            (rec__constrained_attribute__mut_rec__f
                                            (us_split_fields1
                                            temp___expr_172))) 0)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const constrained_attribute__mut_rec__d__first__bit2 Int)

(declare-const constrained_attribute__mut_rec__d__last__bit2 Int)

(declare-const constrained_attribute__mut_rec__d__position2 Int)

;; constrained_attribute__mut_rec__d__first__bit_axiom
  (assert (<= 0 constrained_attribute__mut_rec__d__first__bit2))

;; constrained_attribute__mut_rec__d__last__bit_axiom
  (assert
  (< constrained_attribute__mut_rec__d__first__bit2 constrained_attribute__mut_rec__d__last__bit2))

;; constrained_attribute__mut_rec__d__position_axiom
  (assert (<= 0 constrained_attribute__mut_rec__d__position2))

(declare-const constrained_attribute__mut_rec__f__first__bit2 Int)

(declare-const constrained_attribute__mut_rec__f__last__bit2 Int)

(declare-const constrained_attribute__mut_rec__f__position2 Int)

;; constrained_attribute__mut_rec__f__first__bit_axiom
  (assert (<= 0 constrained_attribute__mut_rec__f__first__bit2))

;; constrained_attribute__mut_rec__f__last__bit_axiom
  (assert
  (< constrained_attribute__mut_rec__f__first__bit2 constrained_attribute__mut_rec__f__last__bit2))

;; constrained_attribute__mut_rec__f__position_axiom
  (assert (<= 0 constrained_attribute__mut_rec__f__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "constrained_attribute.ads", line 9, characters 0-0
  (not
  (forall ((a__split_fields integer) (a__split_discrs integer))
  (=> (= a__split_fields rliteral)
  (=> (= a__split_discrs rliteral)
  (=> (= a__attr__constrained false)
  (=> (in_range 0)
  (let ((constrained_attribute__test__b__assume (us_repqtmk
                                                (us_split_discrsqtmk
                                                a__split_discrs)
                                                (us_split_fieldsqtmk
                                                a__split_fields))))
  (forall ((b__split_fields integer))
  (=>
  (= (us_split_fieldsqtmk b__split_fields) (us_split_fields1
                                           constrained_attribute__test__b__assume))
  (=>
  (= b__split_discrs (us_split_discrs1
                     constrained_attribute__test__b__assume))
  (=> (= b__attr__constrained true)
  (=> (dynamic_invariant
  (us_repqtmk b__split_discrs (us_split_fieldsqtmk b__split_fields)) true
  false true true)
  (=> (= b__attr__constrained true)
  (=>
  (forall ((b__split_fields1 integer)) (is_constrained__function_guard
  (is_constrained
  (us_repqtmk b__split_discrs (us_split_fieldsqtmk b__split_fields1)))
  (us_repqtmk b__split_discrs (us_split_fieldsqtmk b__split_fields1))))
  (=>
  (= (is_constrained
     (us_repqtmk b__split_discrs (us_split_fieldsqtmk b__split_fields))) true)
  (not (= a__attr__constrained true))))))))))))))))))
(check-sat)
(exit)
