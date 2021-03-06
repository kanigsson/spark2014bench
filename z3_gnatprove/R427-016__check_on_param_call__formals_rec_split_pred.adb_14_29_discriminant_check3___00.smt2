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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
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
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__formals_rec_split_pred__rec__d Bool)))))
(define-fun us_split_discrs_rec__formals_rec_split_pred__rec__d__projection ((a us_split_discrs)) Bool 
  (rec__formals_rec_split_pred__rec__d a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__formals_rec_split_pred__rec__f integer)(rec__formals_rec_split_pred__rec__g integer)(rec__formals_rec_split_pred__rec__h natural)))))
(define-fun us_split_fields_rec__formals_rec_split_pred__rec__f__projection ((a us_split_fields)) integer 
  (rec__formals_rec_split_pred__rec__f a))

(define-fun us_split_fields_rec__formals_rec_split_pred__rec__g__projection ((a us_split_fields)) integer 
  (rec__formals_rec_split_pred__rec__g a))

(define-fun us_split_fields_rec__formals_rec_split_pred__rec__h__projection ((a us_split_fields)) natural 
  (rec__formals_rec_split_pred__rec__h a))

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

(define-fun formals_rec_split_pred__rec__f__pred ((a us_rep)) Bool (= (ite 
  (rec__formals_rec_split_pred__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun formals_rec_split_pred__rec__g__pred ((a us_rep)) Bool (= (ite 
  (rec__formals_rec_split_pred__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun formals_rec_split_pred__rec__h__pred ((a us_rep)) Bool (= (ite 
  (rec__formals_rec_split_pred__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__formals_rec_split_pred__rec__d
                                (us_split_discrs1 a)) 1 0) (ite (rec__formals_rec_split_pred__rec__d
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (and
                        (and
                        (=> (formals_rec_split_pred__rec__f__pred a)
                        (= (to_rep1
                           (rec__formals_rec_split_pred__rec__f
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__formals_rec_split_pred__rec__f
                                                  (us_split_fields1 b)))))
                        (=> (formals_rec_split_pred__rec__g__pred a)
                        (= (to_rep1
                           (rec__formals_rec_split_pred__rec__g
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__formals_rec_split_pred__rec__g
                                                  (us_split_fields1 b))))))
                        (=> (formals_rec_split_pred__rec__h__pred a)
                        (= (to_rep
                           (rec__formals_rec_split_pred__rec__h
                           (us_split_fields1 a))) (to_rep
                                                  (rec__formals_rec_split_pred__rec__h
                                                  (us_split_fields1 b)))))))
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

(declare-const formals_rec_split_pred__rec__d__first__bit Int)

(declare-const formals_rec_split_pred__rec__d__last__bit Int)

(declare-const formals_rec_split_pred__rec__d__position Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit formals_rec_split_pred__rec__d__last__bit))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position))

(declare-const formals_rec_split_pred__rec__f__first__bit Int)

(declare-const formals_rec_split_pred__rec__f__last__bit Int)

(declare-const formals_rec_split_pred__rec__f__position Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit formals_rec_split_pred__rec__f__last__bit))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position))

(declare-const formals_rec_split_pred__rec__g__first__bit Int)

(declare-const formals_rec_split_pred__rec__g__last__bit Int)

(declare-const formals_rec_split_pred__rec__g__position Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit formals_rec_split_pred__rec__g__last__bit))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position))

(declare-const formals_rec_split_pred__rec__h__first__bit Int)

(declare-const formals_rec_split_pred__rec__h__last__bit Int)

(declare-const formals_rec_split_pred__rec__h__position Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit formals_rec_split_pred__rec__h__last__bit))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((constr_rec__ref (constr_rec__refqtmk (constr_rec__content us_rep)))))
(define-fun constr_rec__ref_constr_rec__content__projection ((a constr_rec__ref)) us_rep 
  (constr_rec__content a))

(declare-const i1b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range3 ((rec__formals_rec_split_pred__rec__d1 Bool)
  (a us_split_discrs)) Bool (= rec__formals_rec_split_pred__rec__d1 (rec__formals_rec_split_pred__rec__d
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

(declare-const formals_rec_split_pred__rec__d__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__d__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__d__position1 Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit1))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit1 formals_rec_split_pred__rec__d__last__bit1))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position1))

(declare-const formals_rec_split_pred__rec__f__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__f__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__f__position1 Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit1))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit1 formals_rec_split_pred__rec__f__last__bit1))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position1))

(declare-const formals_rec_split_pred__rec__g__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__g__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__g__position1 Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit1))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit1 formals_rec_split_pred__rec__g__last__bit1))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position1))

(declare-const formals_rec_split_pred__rec__h__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__h__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__h__position1 Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit1))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit1 formals_rec_split_pred__rec__h__last__bit1))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((rec____ref (rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(define-fun dynamic_invariant ((temp___expr_187 us_rep)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_184 true))
                                     (in_range3 (distinct 1 0)
                                     (us_split_discrs1 temp___expr_187)))
                                     (=> (= temp___do_toplevel_185 true)
                                     (not
                                     (= (to_rep
                                        (rec__formals_rec_split_pred__rec__h
                                        (us_split_fields1 temp___expr_187))) 0)))))

(define-fun default_initial_assumption ((temp___expr_190 us_rep)
  (temp___skip_top_level_191 Bool)) Bool (and
                                         (= (rec__formals_rec_split_pred__rec__d
                                            (us_split_discrs1
                                            temp___expr_190)) (distinct 1 0))
                                         (and
                                         (and
                                         (=>
                                         (formals_rec_split_pred__rec__f__pred
                                         temp___expr_190)
                                         (= (to_rep1
                                            (rec__formals_rec_split_pred__rec__f
                                            (us_split_fields1
                                            temp___expr_190))) 1))
                                         (=>
                                         (formals_rec_split_pred__rec__g__pred
                                         temp___expr_190)
                                         (= (to_rep1
                                            (rec__formals_rec_split_pred__rec__g
                                            (us_split_fields1
                                            temp___expr_190))) 1)))
                                         (=>
                                         (formals_rec_split_pred__rec__h__pred
                                         temp___expr_190)
                                         (= (to_rep
                                            (rec__formals_rec_split_pred__rec__h
                                            (us_split_fields1
                                            temp___expr_190))) 1)))))

(define-fun dynamic_predicate ((temp___193 us_rep)) Bool (not
                                                         (= (to_rep
                                                            (rec__formals_rec_split_pred__rec__h
                                                            (us_split_fields1
                                                            temp___193))) 0)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

;; Assume
  (assert (dynamic_invariant i1b true false false true))

(assert
;; defqtvc
 ;; File "formals_rec_split_pred.adb", line 13, characters 0-0
  (not (formals_rec_split_pred__rec__h__pred i1b)))
(check-sat)

(exit)
