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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

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

(declare-const c (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c2 (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const d2 (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__const__te__x integer)(rec__const__te__y integer)))))
(define-fun us_split_fields_rec__const__te__x__projection ((a us_split_fields)) integer 
  (rec__const__te__x a))

(define-fun us_split_fields_rec__const__te__y__projection ((a us_split_fields)) integer 
  (rec__const__te__y a))

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
                        (= (to_rep (rec__const__te__x (us_split_fields1 a))) 
                        (to_rep (rec__const__te__x (us_split_fields1 b))))
                        (= (to_rep (rec__const__te__y (us_split_fields1 a))) 
                        (to_rep (rec__const__te__y (us_split_fields1 b)))))
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

(declare-const const__te__x__first__bit Int)

(declare-const const__te__x__last__bit Int)

(declare-const const__te__x__position Int)

;; const__te__x__first__bit_axiom
  (assert (<= 0 const__te__x__first__bit))

;; const__te__x__last__bit_axiom
  (assert (< const__te__x__first__bit const__te__x__last__bit))

;; const__te__x__position_axiom
  (assert (<= 0 const__te__x__position))

(declare-const const__te__y__first__bit Int)

(declare-const const__te__y__last__bit Int)

(declare-const const__te__y__position Int)

;; const__te__y__first__bit_axiom
  (assert (<= 0 const__te__y__first__bit))

;; const__te__y__last__bit_axiom
  (assert (< const__te__y__first__bit const__te__y__last__bit))

;; const__te__y__position_axiom
  (assert (<= 0 const__te__y__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((te__ref 0))
(((te__refqtmk (te__content us_rep)))))
(define-fun te__ref_te__content__projection ((a te__ref)) us_rep (te__content
                                                                 a))

(declare-const e us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const f us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const g us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun fi (tuple0) Int)

(declare-fun fi__function_guard (Int tuple0) Bool)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const j Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-fun fk (tuple0) Int)

(declare-fun fk__function_guard (Int tuple0) Bool)

(declare-const k Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const l Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-fun fm (Int) Int)

(declare-fun fm__function_guard (Int Int) Bool)

(declare-const m Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const p Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-fun const__c__aggregate_def (Int) (Array Int integer))

(declare-fun const__c2__aggregate_def (Int) (Array Int integer))

(declare-fun const__d2__aggregate_def (Int Int) (Array Int integer))

;; c__def_axiom
  (assert (= c (const__c__aggregate_def 1)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___156 Int))
  (=> (dynamic_invariant temp___156 true true true true)
  (forall ((temp___157 Int))
  (= (select (const__c__aggregate_def temp___156) temp___157) rliteral)))))

;; c2__def_axiom
  (assert (= c2 (const__c2__aggregate_def 1)))

;; def_axiom
  (assert
  (forall ((temp___159 Int))
  (=> (dynamic_invariant temp___159 true true true true)
  (forall ((temp___160 Int))
  (= (select (const__c2__aggregate_def temp___159) temp___160) rliteral)))))

;; d2__def_axiom
  (assert (= d2 (const__d2__aggregate_def 1 1)))

;; def_axiom
  (assert
  (forall ((temp___166 Int) (temp___167 Int))
  (let ((temp___165 (const__d2__aggregate_def temp___166 temp___167)))
  (=>
  (and (dynamic_invariant temp___166 true true true true) (dynamic_invariant
  temp___167 true true true true))
  (and (= (select temp___165 1) rliteral) (= (select temp___165 2) rliteral))))))

;; e__def_axiom
  (assert (= e (us_repqtmk (us_split_fieldsqtmk rliteral rliteral))))

;; f__def_axiom
  (assert (= f (us_repqtmk (us_split_fieldsqtmk rliteral rliteral))))

;; g__def_axiom
  (assert (= g (us_repqtmk (us_split_fieldsqtmk rliteral rliteral))))

;; fi__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (fi us_void_param)))
     (=> (fi__function_guard result us_void_param) (dynamic_invariant result
     true false true true))) :pattern ((fi us_void_param)) )))

;; fi__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (fi us_void_param) 1) :pattern ((fi us_void_param)) )))

;; i__def_axiom
  (assert (and (fi__function_guard (fi Tuple0) Tuple0) (= i (fi Tuple0))))

;; j__def_axiom
  (assert
  (and (fi__function_guard (fi Tuple0) Tuple0) (= j (- (* 2 (fi Tuple0)) 1))))

;; fk__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (fk us_void_param)))
     (=> (fk__function_guard result us_void_param) (dynamic_invariant result
     true false true true))) :pattern ((fk us_void_param)) )))

;; fk__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (fk us_void_param) 1) :pattern ((fk us_void_param)) )))

;; k__def_axiom
  (assert (and (fk__function_guard (fk Tuple0) Tuple0) (= k (fk Tuple0))))

;; l__def_axiom
  (assert
  (and (fk__function_guard (fk Tuple0) Tuple0) (= l (- (* 2 (fk Tuple0)) 1))))

;; fm__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (fm x)))
     (=> (fm__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((fm x)) )))

;; fm__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (fm x) x)) :pattern (
  (fm x)) )))

;; m__def_axiom
  (assert (and (fm__function_guard (fm 1) 1) (= m (fm 1))))

;; n__def_axiom
  (assert (and (fm__function_guard (fm 1) 1) (= n (- (* 2 (fm 1)) 1))))

(assert
;; defqtvc
 ;; File "const.ads", line 39, characters 0-0
  (not
  (forall ((o Int))
  (=> (= (const__c__aggregate_def 1) c)
  (=> (= (const__c2__aggregate_def 1) c2)
  (=> (= (const__d2__aggregate_def 1 1) d2)
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral rliteral)) e)
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral rliteral)) f)
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral rliteral)) g)
  (=> (dynamic_invariant i true false true true)
  (=> (= (fi Tuple0) i)
  (=> (dynamic_invariant j true false true true)
  (=> (= (- (* 2 (fi Tuple0)) 1) j)
  (=> (dynamic_invariant k true false true true)
  (=> (= (fk Tuple0) k)
  (=> (dynamic_invariant l true false true true)
  (=> (= (- (* 2 (fk Tuple0)) 1) l)
  (=> (dynamic_invariant m true false true true)
  (=> (= (fm 1) m)
  (=> (dynamic_invariant n true false true true)
  (=> (= (- (* 2 (fm 1)) 1) n)
  (=> (dynamic_invariant o true false true true)
  (=> (dynamic_invariant p true false true true)
  (=> (= (to_rep (select c 1)) 1)
  (=> (= (to_rep (select c 2)) 1)
  (=> (= (to_rep (select c2 1)) 1)
  (=> (= (to_rep (select c2 2)) 1)
  (=> (= (to_rep (select d2 1)) 1)
  (=> (= (to_rep (select d2 2)) 1)
  (=> (= (to_rep (rec__const__te__x (us_split_fields1 e))) 1)
  (=> (= (to_rep (rec__const__te__y (us_split_fields1 e))) 1)
  (=> (= (to_rep (rec__const__te__x (us_split_fields1 f))) 1)
  (=> (= (to_rep (rec__const__te__y (us_split_fields1 f))) 1)
  (=> (= (to_rep (rec__const__te__x (us_split_fields1 g))) 1)
  (=> (= (to_rep (rec__const__te__y (us_split_fields1 g))) 1)
  (=> (= i 1) (=> (= j 1) (=> (= k 1) (=> (= l 1) (= m 1))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
