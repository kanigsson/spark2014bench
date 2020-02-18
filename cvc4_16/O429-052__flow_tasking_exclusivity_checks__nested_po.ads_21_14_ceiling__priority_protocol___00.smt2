;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-sort pt 0)

(declare-fun user_eq (pt pt) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-datatypes ((pt__ref 0))
(((pt__refqtmk (pt__content pt)))))
(define-fun pt__ref_pt__content__projection ((a pt__ref)) pt (pt__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__nested_po__inner__po pt)))))
(define-fun us_split_fields_rec__nested_po__inner__po__projection ((a us_split_fields)) pt 
  (rec__nested_po__inner__po a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const nested_po__inner__po__first__bit Int)

(declare-const nested_po__inner__po__last__bit Int)

(declare-const nested_po__inner__po__position Int)

;; nested_po__inner__po__first__bit_axiom
  (assert (<= 0 nested_po__inner__po__first__bit))

;; nested_po__inner__po__last__bit_axiom
  (assert
  (< nested_po__inner__po__first__bit nested_po__inner__po__last__bit))

;; nested_po__inner__po__position_axiom
  (assert (<= 0 nested_po__inner__po__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((inner__ref 0))
(((inner__refqtmk (inner__content us_rep)))))
(define-fun inner__ref_inner__content__projection ((a inner__ref)) us_rep 
  (inner__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__nested_po__outer__inner_rec us_rep)))))
(define-fun us_split_fields_rec__nested_po__outer__inner_rec__projection ((a us_split_fields2)) us_rep 
  (rec__nested_po__outer__inner_rec a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const nested_po__outer__inner_rec__first__bit Int)

(declare-const nested_po__outer__inner_rec__last__bit Int)

(declare-const nested_po__outer__inner_rec__position Int)

;; nested_po__outer__inner_rec__first__bit_axiom
  (assert (<= 0 nested_po__outer__inner_rec__first__bit))

;; nested_po__outer__inner_rec__last__bit_axiom
  (assert
  (< nested_po__outer__inner_rec__first__bit nested_po__outer__inner_rec__last__bit))

;; nested_po__outer__inner_rec__position_axiom
  (assert (<= 0 nested_po__outer__inner_rec__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy1 us_rep1)

(declare-datatypes ((outer__ref 0))
(((outer__refqtmk (outer__content us_rep1)))))
(define-fun outer__ref_outer__content__projection ((a outer__ref)) us_rep1 
  (outer__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort priority 0)

(declare-fun priorityqtint (priority) Int)

;; priority'axiom
  (assert
  (forall ((i priority))
  (and (<= 0 (priorityqtint i)) (<= (priorityqtint i) 97))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 97)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq3 (priority priority) Bool)

(declare-const dummy2 priority)

(declare-datatypes ((priority__ref 0))
(((priority__refqtmk (priority__content priority)))))
(define-fun priority__ref_priority__content__projection ((a priority__ref)) priority 
  (priority__content a))

(define-fun dynamic_invariant ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 0 97)) (in_range temp___expr_165)))

(assert
;; defqtvc
 ;; File "nested_po.ads", line 21, characters 0-0
  (not (<= 97 97)))
(check-sat)