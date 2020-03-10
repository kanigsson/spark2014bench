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

(declare-const x Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const b1 Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const b2 Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun to_rep ((x1 integer)) Int (integerqtint x1))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x1 integer))
  (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; range_axiom
  (assert
  (forall ((x1 integer)) (! (in_range1 (to_rep x1)) :pattern ((to_rep x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range1 x1) (= (to_rep (of_rep x1)) x1)) :pattern ((to_rep
                                                               (of_rep x1))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__formals_rec_split__rec__d Bool)))))
(define-fun us_split_discrs_rec__formals_rec_split__rec__d__projection ((a us_split_discrs)) Bool 
  (rec__formals_rec_split__rec__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__formals_rec_split__rec__f integer)))))
(define-fun us_split_fields_rec__formals_rec_split__rec__f__projection ((a us_split_fields)) integer 
  (rec__formals_rec_split__rec__f a))

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

(define-fun formals_rec_split__rec__f__pred ((a us_rep)) Bool (= (ite 
  (rec__formals_rec_split__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__formals_rec_split__rec__d
                                (us_split_discrs1 a)) 1 0) (ite (rec__formals_rec_split__rec__d
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=> (formals_rec_split__rec__f__pred a)
                        (= (to_rep
                           (rec__formals_rec_split__rec__f
                           (us_split_fields1 a))) (to_rep
                                                  (rec__formals_rec_split__rec__f
                                                  (us_split_fields1 b))))))
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

(declare-const formals_rec_split__rec__d__first__bit Int)

(declare-const formals_rec_split__rec__d__last__bit Int)

(declare-const formals_rec_split__rec__d__position Int)

;; formals_rec_split__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split__rec__d__first__bit))

;; formals_rec_split__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split__rec__d__first__bit formals_rec_split__rec__d__last__bit))

;; formals_rec_split__rec__d__position_axiom
  (assert (<= 0 formals_rec_split__rec__d__position))

(declare-const formals_rec_split__rec__f__first__bit Int)

(declare-const formals_rec_split__rec__f__last__bit Int)

(declare-const formals_rec_split__rec__f__position Int)

;; formals_rec_split__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split__rec__f__first__bit))

;; formals_rec_split__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split__rec__f__first__bit formals_rec_split__rec__f__last__bit))

;; formals_rec_split__rec__f__position_axiom
  (assert (<= 0 formals_rec_split__rec__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((constr_rec__ref 0))
(((constr_rec__refqtmk (constr_rec__content us_rep)))))
(define-fun constr_rec__ref_constr_rec__content__projection ((a constr_rec__ref)) us_rep 
  (constr_rec__content a))

(define-fun in_range2 ((rec__formals_rec_split__rec__d1 Bool)
  (a us_split_discrs)) Bool (= rec__formals_rec_split__rec__d1 (rec__formals_rec_split__rec__d
                                                               a)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const formals_rec_split__rec__d__first__bit1 Int)

(declare-const formals_rec_split__rec__d__last__bit1 Int)

(declare-const formals_rec_split__rec__d__position1 Int)

;; formals_rec_split__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split__rec__d__first__bit1))

;; formals_rec_split__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split__rec__d__first__bit1 formals_rec_split__rec__d__last__bit1))

;; formals_rec_split__rec__d__position_axiom
  (assert (<= 0 formals_rec_split__rec__d__position1))

(declare-const formals_rec_split__rec__f__first__bit1 Int)

(declare-const formals_rec_split__rec__f__last__bit1 Int)

(declare-const formals_rec_split__rec__f__position1 Int)

;; formals_rec_split__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split__rec__f__first__bit1))

;; formals_rec_split__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split__rec__f__first__bit1 formals_rec_split__rec__f__last__bit1))

;; formals_rec_split__rec__f__position_axiom
  (assert (<= 0 formals_rec_split__rec__f__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((rec____ref 0))
(((rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(define-fun dynamic_invariant ((temp___expr_164 us_rep)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (not (= temp___skip_constant_161 true))
                                     (in_range2 x
                                     (us_split_discrs1 temp___expr_164))))

(define-fun default_initial_assumption ((temp___expr_166 us_rep)
  (temp___skip_top_level_167 Bool)) Bool (and
                                         (= (rec__formals_rec_split__rec__d
                                            (us_split_discrs1
                                            temp___expr_166)) x)
                                         (=> (formals_rec_split__rec__f__pred
                                         temp___expr_166)
                                         (= (to_rep
                                            (rec__formals_rec_split__rec__f
                                            (us_split_fields1
                                            temp___expr_166))) 1))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const formals_rec_split__rec__d__first__bit2 Int)

(declare-const formals_rec_split__rec__d__last__bit2 Int)

(declare-const formals_rec_split__rec__d__position2 Int)

;; formals_rec_split__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split__rec__d__first__bit2))

;; formals_rec_split__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split__rec__d__first__bit2 formals_rec_split__rec__d__last__bit2))

;; formals_rec_split__rec__d__position_axiom
  (assert (<= 0 formals_rec_split__rec__d__position2))

(declare-const formals_rec_split__rec__f__first__bit2 Int)

(declare-const formals_rec_split__rec__f__last__bit2 Int)

(declare-const formals_rec_split__rec__f__position2 Int)

;; formals_rec_split__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split__rec__f__first__bit2))

;; formals_rec_split__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split__rec__f__first__bit2 formals_rec_split__rec__f__last__bit2))

;; formals_rec_split__rec__f__position_axiom
  (assert (<= 0 formals_rec_split__rec__f__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((constr_rec_2__ref 0))
(((constr_rec_2__refqtmk (constr_rec_2__content us_rep)))))
(define-fun constr_rec_2__ref_constr_rec_2__content__projection ((a constr_rec_2__ref)) us_rep 
  (constr_rec_2__content a))

(define-fun dynamic_invariant1 ((temp___expr_173 us_rep)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (not (= temp___skip_constant_170 true))
                                     (in_range2 y
                                     (us_split_discrs1 temp___expr_173))))

(define-fun default_initial_assumption1 ((temp___expr_175 us_rep)
  (temp___skip_top_level_176 Bool)) Bool (and
                                         (= (rec__formals_rec_split__rec__d
                                            (us_split_discrs1
                                            temp___expr_175)) y)
                                         (=> (formals_rec_split__rec__f__pred
                                         temp___expr_175)
                                         (= (to_rep
                                            (rec__formals_rec_split__rec__f
                                            (us_split_fields1
                                            temp___expr_175))) 1))))

(declare-const v__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const u__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(assert
;; defqtvc
 ;; File "formals_rec_split.adb", line 1, characters 0-0
  (not
  (forall ((v__split_fields integer) (u__split_fields integer)
  (v__split_fields1 integer) (spark__branch Bool) (u__split_fields1 integer)
  (spark__branch1 Bool) (spark__branch2 Bool))
  (=> (default_initial_assumption
  (us_repqtmk v__split_discrs (us_split_fieldsqtmk v__split_fields)) false)
  (=> (dynamic_invariant
  (us_repqtmk v__split_discrs (us_split_fieldsqtmk v__split_fields)) false
  false true true)
  (=> (default_initial_assumption1
  (us_repqtmk u__split_discrs (us_split_fieldsqtmk u__split_fields)) false)
  (=> (dynamic_invariant1
  (us_repqtmk u__split_discrs (us_split_fieldsqtmk u__split_fields)) false
  false true true)
  (=> (dynamic_invariant
  (us_repqtmk v__split_discrs (us_split_fieldsqtmk v__split_fields1)) true
  true true true)
  (=> (= spark__branch y)
  (=>
  (ite (= spark__branch true) (= u__split_fields1 rliteral)
  (= u__split_fields1 u__split_fields))
  (=> (= spark__branch1 b1)
  (=> (= spark__branch1 true)
  (=> (= spark__branch2 b2)
  (=> (= spark__branch2 true) (in_range2 x
  (us_split_discrs1
  (us_repqtmk u__split_discrs (us_split_fieldsqtmk u__split_fields1))))))))))))))))))
(check-sat)
(exit)
