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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__foo__dt__found Bool)))))
(define-fun us_split_discrs_rec__foo__dt__found__projection ((a us_split_discrs)) Bool 
  (rec__foo__dt__found a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__foo__dt__index positive)))))
(define-fun us_split_fields_rec__foo__dt__index__projection ((a us_split_fields)) positive 
  (rec__foo__dt__index a))

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

(define-fun foo__dt__index__pred ((a us_rep)) Bool (= (ite (rec__foo__dt__found
                                                           (us_split_discrs1
                                                           a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__foo__dt__found (us_split_discrs1 a)) 1 0) (ite 
                        (rec__foo__dt__found (us_split_discrs1 b)) 1 0))
                        (=> (foo__dt__index__pred a)
                        (= (to_rep
                           (rec__foo__dt__index (us_split_fields1 a))) 
                        (to_rep (rec__foo__dt__index (us_split_fields1 b))))))
                   true false))

(define-fun in_range2 ((rec__foo__dt__found1 Bool)
  (a us_split_discrs)) Bool (= rec__foo__dt__found1 (rec__foo__dt__found a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const foo__dt__found__first__bit Int)

(declare-const foo__dt__found__last__bit Int)

(declare-const foo__dt__found__position Int)

;; foo__dt__found__first__bit_axiom
  (assert (<= 0 foo__dt__found__first__bit))

;; foo__dt__found__last__bit_axiom
  (assert (< foo__dt__found__first__bit foo__dt__found__last__bit))

;; foo__dt__found__position_axiom
  (assert (<= 0 foo__dt__found__position))

(declare-const foo__dt__index__first__bit Int)

(declare-const foo__dt__index__last__bit Int)

(declare-const foo__dt__index__position Int)

;; foo__dt__index__first__bit_axiom
  (assert (<= 0 foo__dt__index__first__bit))

;; foo__dt__index__last__bit_axiom
  (assert (< foo__dt__index__first__bit foo__dt__index__last__bit))

;; foo__dt__index__position_axiom
  (assert (<= 0 foo__dt__index__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((dt__ref 0))
(((dt__refqtmk (dt__content us_rep)))))
(define-fun dt__ref_dt__content__projection ((a dt__ref)) us_rep (dt__content
                                                                 a))

(declare-const a__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const r42b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r45b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const foo__dt__found__first__bit1 Int)

(declare-const foo__dt__found__last__bit1 Int)

(declare-const foo__dt__found__position1 Int)

;; foo__dt__found__first__bit_axiom
  (assert (<= 0 foo__dt__found__first__bit1))

;; foo__dt__found__last__bit_axiom
  (assert (< foo__dt__found__first__bit1 foo__dt__found__last__bit1))

;; foo__dt__found__position_axiom
  (assert (<= 0 foo__dt__found__position1))

(declare-const foo__dt__index__first__bit1 Int)

(declare-const foo__dt__index__last__bit1 Int)

(declare-const foo__dt__index__position1 Int)

;; foo__dt__index__first__bit_axiom
  (assert (<= 0 foo__dt__index__first__bit1))

;; foo__dt__index__last__bit_axiom
  (assert (< foo__dt__index__first__bit1 foo__dt__index__last__bit1))

;; foo__dt__index__position_axiom
  (assert (<= 0 foo__dt__index__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t43b__ref 0))
(((t43b__refqtmk (t43b__content us_rep)))))
(define-fun t43b__ref_t43b__content__projection ((a t43b__ref)) us_rep 
  (t43b__content a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const foo__dt__found__first__bit2 Int)

(declare-const foo__dt__found__last__bit2 Int)

(declare-const foo__dt__found__position2 Int)

;; foo__dt__found__first__bit_axiom
  (assert (<= 0 foo__dt__found__first__bit2))

;; foo__dt__found__last__bit_axiom
  (assert (< foo__dt__found__first__bit2 foo__dt__found__last__bit2))

;; foo__dt__found__position_axiom
  (assert (<= 0 foo__dt__found__position2))

(declare-const foo__dt__index__first__bit2 Int)

(declare-const foo__dt__index__last__bit2 Int)

(declare-const foo__dt__index__position2 Int)

;; foo__dt__index__first__bit_axiom
  (assert (<= 0 foo__dt__index__first__bit2))

;; foo__dt__index__last__bit_axiom
  (assert (< foo__dt__index__first__bit2 foo__dt__index__last__bit2))

;; foo__dt__index__position_axiom
  (assert (<= 0 foo__dt__index__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t46b__ref 0))
(((t46b__refqtmk (t46b__content us_rep)))))
(define-fun t46b__ref_t46b__content__projection ((a t46b__ref)) us_rep 
  (t46b__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(assert
;; defqtvc
 ;; File "foo.adb", line 115, characters 0-0
  (not
  (forall ((spark__branch Bool))
  (=>
  (= spark__branch (ite (= (ite (rec__foo__dt__found a__split_discrs) 1 0) 1)
                   true false))
  (=> (not (= spark__branch true))
  (=> (= (rec__foo__dt__found a__split_discrs) r45b)
  (= (distinct 0 0) (rec__foo__dt__found a__split_discrs))))))))
(check-sat)
(exit)
