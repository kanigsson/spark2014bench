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

(declare-sort type_0 0)

(declare-fun type_0qtint (type_0) Int)

;; type_0'axiom
  (assert
  (forall ((i type_0))
  (and (<= (- 2147483648) (type_0qtint i)) (<= (type_0qtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (type_0 type_0) Bool)

(declare-const dummy type_0)

(declare-datatypes ()
((type_0__ref (type_0__refqtmk (type_0__content type_0)))))
(define-fun type_0__ref_type_0__content__projection ((a type_0__ref)) type_0 
  (type_0__content a))

(define-fun to_rep ((x type_0)) Int (type_0qtint x))

(declare-fun of_rep (Int) type_0)

;; inversion_axiom
  (assert
  (forall ((x type_0)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x type_0)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__p__type_1__field_0 type_0)(rec__p__type_1__field_1 type_0)(rec__p__type_1__field_2 type_0)(rec__p__type_1__field_3 type_0)(rec__p__type_1__field_4 type_0)(rec__p__type_1__field_5 type_0)(rec__p__type_1__field_6 type_0)(rec__p__type_1__field_7 type_0)))))
(define-fun us_split_fields_rec__p__type_1__field_0__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_0 a))

(define-fun us_split_fields_rec__p__type_1__field_1__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_1 a))

(define-fun us_split_fields_rec__p__type_1__field_2__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_2 a))

(define-fun us_split_fields_rec__p__type_1__field_3__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_3 a))

(define-fun us_split_fields_rec__p__type_1__field_4__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_4 a))

(define-fun us_split_fields_rec__p__type_1__field_5__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_5 a))

(define-fun us_split_fields_rec__p__type_1__field_6__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_6 a))

(define-fun us_split_fields_rec__p__type_1__field_7__projection ((a us_split_fields)) type_0 
  (rec__p__type_1__field_7 a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__p__type_1__field_0 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_0 (us_split_fields1 b))))
                        (= (to_rep
                           (rec__p__type_1__field_1 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_1 (us_split_fields1 b)))))
                        (and
                        (and
                        (and
                        (= (to_rep
                           (rec__p__type_1__field_2 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_2 (us_split_fields1 b))))
                        (= (to_rep
                           (rec__p__type_1__field_3 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_3 (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__p__type_1__field_4 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_4 (us_split_fields1 b)))))
                        (and
                        (and
                        (= (to_rep
                           (rec__p__type_1__field_5 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_5 (us_split_fields1 b))))
                        (= (to_rep
                           (rec__p__type_1__field_6 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_6 (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__p__type_1__field_7 (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__type_1__field_7 (us_split_fields1 b)))))))
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

(declare-const p__type_1__field_0__first__bit Int)

(declare-const p__type_1__field_0__last__bit Int)

(declare-const p__type_1__field_0__position Int)

;; p__type_1__field_0__first__bit_axiom
  (assert (<= 0 p__type_1__field_0__first__bit))

;; p__type_1__field_0__last__bit_axiom
  (assert (< p__type_1__field_0__first__bit p__type_1__field_0__last__bit))

;; p__type_1__field_0__position_axiom
  (assert (<= 0 p__type_1__field_0__position))

(declare-const p__type_1__field_1__first__bit Int)

(declare-const p__type_1__field_1__last__bit Int)

(declare-const p__type_1__field_1__position Int)

;; p__type_1__field_1__first__bit_axiom
  (assert (<= 0 p__type_1__field_1__first__bit))

;; p__type_1__field_1__last__bit_axiom
  (assert (< p__type_1__field_1__first__bit p__type_1__field_1__last__bit))

;; p__type_1__field_1__position_axiom
  (assert (<= 0 p__type_1__field_1__position))

(declare-const p__type_1__field_2__first__bit Int)

(declare-const p__type_1__field_2__last__bit Int)

(declare-const p__type_1__field_2__position Int)

;; p__type_1__field_2__first__bit_axiom
  (assert (<= 0 p__type_1__field_2__first__bit))

;; p__type_1__field_2__last__bit_axiom
  (assert (< p__type_1__field_2__first__bit p__type_1__field_2__last__bit))

;; p__type_1__field_2__position_axiom
  (assert (<= 0 p__type_1__field_2__position))

(declare-const p__type_1__field_3__first__bit Int)

(declare-const p__type_1__field_3__last__bit Int)

(declare-const p__type_1__field_3__position Int)

;; p__type_1__field_3__first__bit_axiom
  (assert (<= 0 p__type_1__field_3__first__bit))

;; p__type_1__field_3__last__bit_axiom
  (assert (< p__type_1__field_3__first__bit p__type_1__field_3__last__bit))

;; p__type_1__field_3__position_axiom
  (assert (<= 0 p__type_1__field_3__position))

(declare-const p__type_1__field_4__first__bit Int)

(declare-const p__type_1__field_4__last__bit Int)

(declare-const p__type_1__field_4__position Int)

;; p__type_1__field_4__first__bit_axiom
  (assert (<= 0 p__type_1__field_4__first__bit))

;; p__type_1__field_4__last__bit_axiom
  (assert (< p__type_1__field_4__first__bit p__type_1__field_4__last__bit))

;; p__type_1__field_4__position_axiom
  (assert (<= 0 p__type_1__field_4__position))

(declare-const p__type_1__field_5__first__bit Int)

(declare-const p__type_1__field_5__last__bit Int)

(declare-const p__type_1__field_5__position Int)

;; p__type_1__field_5__first__bit_axiom
  (assert (<= 0 p__type_1__field_5__first__bit))

;; p__type_1__field_5__last__bit_axiom
  (assert (< p__type_1__field_5__first__bit p__type_1__field_5__last__bit))

;; p__type_1__field_5__position_axiom
  (assert (<= 0 p__type_1__field_5__position))

(declare-const p__type_1__field_6__first__bit Int)

(declare-const p__type_1__field_6__last__bit Int)

(declare-const p__type_1__field_6__position Int)

;; p__type_1__field_6__first__bit_axiom
  (assert (<= 0 p__type_1__field_6__first__bit))

;; p__type_1__field_6__last__bit_axiom
  (assert (< p__type_1__field_6__first__bit p__type_1__field_6__last__bit))

;; p__type_1__field_6__position_axiom
  (assert (<= 0 p__type_1__field_6__position))

(declare-const p__type_1__field_7__first__bit Int)

(declare-const p__type_1__field_7__last__bit Int)

(declare-const p__type_1__field_7__position Int)

;; p__type_1__field_7__first__bit_axiom
  (assert (<= 0 p__type_1__field_7__first__bit))

;; p__type_1__field_7__last__bit_axiom
  (assert (< p__type_1__field_7__first__bit p__type_1__field_7__last__bit))

;; p__type_1__field_7__position_axiom
  (assert (<= 0 p__type_1__field_7__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((type_1__ref (type_1__refqtmk (type_1__content us_rep)))))
(define-fun type_1__ref_type_1__content__projection ((a type_1__ref)) us_rep 
  (type_1__content a))

(declare-fun create_type_1 (tuple0) us_rep)

(declare-fun create_type_1__function_guard (us_rep tuple0) Bool)

;; create_type_1__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (create_type_1 us_void_param)))
     (=> (create_type_1__function_guard result us_void_param)
     (and
     (and
     (and
     (and
     (and
     (and
     (and (= (to_rep (rec__p__type_1__field_0 (us_split_fields1 result))) 0)
     (= (to_rep (rec__p__type_1__field_1 (us_split_fields1 result))) 0))
     (= (to_rep (rec__p__type_1__field_2 (us_split_fields1 result))) 0))
     (= (to_rep (rec__p__type_1__field_3 (us_split_fields1 result))) 0))
     (= (to_rep (rec__p__type_1__field_4 (us_split_fields1 result))) 0))
     (= (to_rep (rec__p__type_1__field_5 (us_split_fields1 result))) 0))
     (= (to_rep (rec__p__type_1__field_6 (us_split_fields1 result))) 0))
     (= (to_rep (rec__p__type_1__field_7 (us_split_fields1 result))) 0)))) :pattern (
  (create_type_1 us_void_param)) )))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__p__type_2__field_0 us_rep)(rec__p__type_2__field_1 us_rep)(rec__p__type_2__field_2 us_rep)(rec__p__type_2__field_3 us_rep)(rec__p__type_2__field_4 us_rep)))))
(define-fun us_split_fields_rec__p__type_2__field_0__projection ((a us_split_fields2)) us_rep 
  (rec__p__type_2__field_0 a))

(define-fun us_split_fields_rec__p__type_2__field_1__projection ((a us_split_fields2)) us_rep 
  (rec__p__type_2__field_1 a))

(define-fun us_split_fields_rec__p__type_2__field_2__projection ((a us_split_fields2)) us_rep 
  (rec__p__type_2__field_2 a))

(define-fun us_split_fields_rec__p__type_2__field_3__projection ((a us_split_fields2)) us_rep 
  (rec__p__type_2__field_3 a))

(define-fun us_split_fields_rec__p__type_2__field_4__projection ((a us_split_fields2)) us_rep 
  (rec__p__type_2__field_4 a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (bool_eq
                            (rec__p__type_2__field_0 (us_split_fields3 a))
                            (rec__p__type_2__field_0 (us_split_fields3 b))) true)
                         (= (bool_eq
                            (rec__p__type_2__field_1 (us_split_fields3 a))
                            (rec__p__type_2__field_1 (us_split_fields3 b))) true))
                         (and
                         (and
                         (= (bool_eq
                            (rec__p__type_2__field_2 (us_split_fields3 a))
                            (rec__p__type_2__field_2 (us_split_fields3 b))) true)
                         (= (bool_eq
                            (rec__p__type_2__field_3 (us_split_fields3 a))
                            (rec__p__type_2__field_3 (us_split_fields3 b))) true))
                         (= (bool_eq
                            (rec__p__type_2__field_4 (us_split_fields3 a))
                            (rec__p__type_2__field_4 (us_split_fields3 b))) true)))
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

(declare-const p__type_2__field_0__first__bit Int)

(declare-const p__type_2__field_0__last__bit Int)

(declare-const p__type_2__field_0__position Int)

;; p__type_2__field_0__first__bit_axiom
  (assert (<= 0 p__type_2__field_0__first__bit))

;; p__type_2__field_0__last__bit_axiom
  (assert (< p__type_2__field_0__first__bit p__type_2__field_0__last__bit))

;; p__type_2__field_0__position_axiom
  (assert (<= 0 p__type_2__field_0__position))

(declare-const p__type_2__field_1__first__bit Int)

(declare-const p__type_2__field_1__last__bit Int)

(declare-const p__type_2__field_1__position Int)

;; p__type_2__field_1__first__bit_axiom
  (assert (<= 0 p__type_2__field_1__first__bit))

;; p__type_2__field_1__last__bit_axiom
  (assert (< p__type_2__field_1__first__bit p__type_2__field_1__last__bit))

;; p__type_2__field_1__position_axiom
  (assert (<= 0 p__type_2__field_1__position))

(declare-const p__type_2__field_2__first__bit Int)

(declare-const p__type_2__field_2__last__bit Int)

(declare-const p__type_2__field_2__position Int)

;; p__type_2__field_2__first__bit_axiom
  (assert (<= 0 p__type_2__field_2__first__bit))

;; p__type_2__field_2__last__bit_axiom
  (assert (< p__type_2__field_2__first__bit p__type_2__field_2__last__bit))

;; p__type_2__field_2__position_axiom
  (assert (<= 0 p__type_2__field_2__position))

(declare-const p__type_2__field_3__first__bit Int)

(declare-const p__type_2__field_3__last__bit Int)

(declare-const p__type_2__field_3__position Int)

;; p__type_2__field_3__first__bit_axiom
  (assert (<= 0 p__type_2__field_3__first__bit))

;; p__type_2__field_3__last__bit_axiom
  (assert (< p__type_2__field_3__first__bit p__type_2__field_3__last__bit))

;; p__type_2__field_3__position_axiom
  (assert (<= 0 p__type_2__field_3__position))

(declare-const p__type_2__field_4__first__bit Int)

(declare-const p__type_2__field_4__last__bit Int)

(declare-const p__type_2__field_4__position Int)

;; p__type_2__field_4__first__bit_axiom
  (assert (<= 0 p__type_2__field_4__first__bit))

;; p__type_2__field_4__last__bit_axiom
  (assert (< p__type_2__field_4__first__bit p__type_2__field_4__last__bit))

;; p__type_2__field_4__position_axiom
  (assert (<= 0 p__type_2__field_4__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((type_2__ref (type_2__refqtmk (type_2__content us_rep1)))))
(define-fun type_2__ref_type_2__content__projection ((a type_2__ref)) us_rep1 
  (type_2__content a))

(declare-fun create_type_2 (tuple0) us_rep1)

(declare-fun create_type_2__function_guard (us_rep1 tuple0) Bool)

;; create_type_2__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (create_type_2 us_void_param)))
     (and (create_type_1__function_guard (create_type_1 Tuple0) Tuple0)
     (and (create_type_1__function_guard (create_type_1 Tuple0) Tuple0)
     (and (create_type_1__function_guard (create_type_1 Tuple0) Tuple0)
     (and (create_type_1__function_guard (create_type_1 Tuple0) Tuple0)
     (and (create_type_1__function_guard (create_type_1 Tuple0) Tuple0)
     (=> (create_type_2__function_guard result us_void_param)
     (and
     (and
     (and
     (and
     (= (bool_eq (rec__p__type_2__field_0 (us_split_fields3 result))
        (create_type_1 Tuple0)) true)
     (= (bool_eq (rec__p__type_2__field_1 (us_split_fields3 result))
        (create_type_1 Tuple0)) true))
     (= (bool_eq (rec__p__type_2__field_2 (us_split_fields3 result))
        (create_type_1 Tuple0)) true))
     (= (bool_eq (rec__p__type_2__field_3 (us_split_fields3 result))
        (create_type_1 Tuple0)) true))
     (= (bool_eq (rec__p__type_2__field_4 (us_split_fields3 result))
        (create_type_1 Tuple0)) true))))))))) :pattern ((create_type_2
                                                        us_void_param)) )))

(declare-datatypes ()
((us_split_fields4
 (us_split_fieldsqtmk2
 (rec__p__type_4__field_0 us_rep)(rec__p__type_4__field_1 us_rep)(rec__p__type_4__field_2 us_rep1)(rec__p__type_4__field_3 us_rep1)))))
(define-fun us_split_fields_rec__p__type_4__field_0__projection ((a us_split_fields4)) us_rep 
  (rec__p__type_4__field_0 a))

(define-fun us_split_fields_rec__p__type_4__field_1__projection ((a us_split_fields4)) us_rep 
  (rec__p__type_4__field_1 a))

(define-fun us_split_fields_rec__p__type_4__field_2__projection ((a us_split_fields4)) us_rep1 
  (rec__p__type_4__field_2 a))

(define-fun us_split_fields_rec__p__type_4__field_3__projection ((a us_split_fields4)) us_rep1 
  (rec__p__type_4__field_3 a))

(declare-datatypes ()
((us_split_fields__ref2
 (us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ()
((us_rep2 (us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (and
                         (= (bool_eq
                            (rec__p__type_4__field_0 (us_split_fields5 a))
                            (rec__p__type_4__field_0 (us_split_fields5 b))) true)
                         (= (bool_eq
                            (rec__p__type_4__field_1 (us_split_fields5 a))
                            (rec__p__type_4__field_1 (us_split_fields5 b))) true))
                         (and
                         (= (bool_eq1
                            (rec__p__type_4__field_2 (us_split_fields5 a))
                            (rec__p__type_4__field_2 (us_split_fields5 b))) true)
                         (= (bool_eq1
                            (rec__p__type_4__field_3 (us_split_fields5 a))
                            (rec__p__type_4__field_3 (us_split_fields5 b))) true)))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p__type_4__field_0__first__bit Int)

(declare-const p__type_4__field_0__last__bit Int)

(declare-const p__type_4__field_0__position Int)

;; p__type_4__field_0__first__bit_axiom
  (assert (<= 0 p__type_4__field_0__first__bit))

;; p__type_4__field_0__last__bit_axiom
  (assert (< p__type_4__field_0__first__bit p__type_4__field_0__last__bit))

;; p__type_4__field_0__position_axiom
  (assert (<= 0 p__type_4__field_0__position))

(declare-const p__type_4__field_1__first__bit Int)

(declare-const p__type_4__field_1__last__bit Int)

(declare-const p__type_4__field_1__position Int)

;; p__type_4__field_1__first__bit_axiom
  (assert (<= 0 p__type_4__field_1__first__bit))

;; p__type_4__field_1__last__bit_axiom
  (assert (< p__type_4__field_1__first__bit p__type_4__field_1__last__bit))

;; p__type_4__field_1__position_axiom
  (assert (<= 0 p__type_4__field_1__position))

(declare-const p__type_4__field_2__first__bit Int)

(declare-const p__type_4__field_2__last__bit Int)

(declare-const p__type_4__field_2__position Int)

;; p__type_4__field_2__first__bit_axiom
  (assert (<= 0 p__type_4__field_2__first__bit))

;; p__type_4__field_2__last__bit_axiom
  (assert (< p__type_4__field_2__first__bit p__type_4__field_2__last__bit))

;; p__type_4__field_2__position_axiom
  (assert (<= 0 p__type_4__field_2__position))

(declare-const p__type_4__field_3__first__bit Int)

(declare-const p__type_4__field_3__last__bit Int)

(declare-const p__type_4__field_3__position Int)

;; p__type_4__field_3__first__bit_axiom
  (assert (<= 0 p__type_4__field_3__first__bit))

;; p__type_4__field_3__last__bit_axiom
  (assert (< p__type_4__field_3__first__bit p__type_4__field_3__last__bit))

;; p__type_4__field_3__position_axiom
  (assert (<= 0 p__type_4__field_3__position))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ()
((type_4__ref (type_4__refqtmk (type_4__content us_rep2)))))
(define-fun type_4__ref_type_4__content__projection ((a type_4__ref)) us_rep2 
  (type_4__content a))

(define-fun dynamic_invariant ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range temp___expr_164)))

(define-fun o () us_rep1 (create_type_2 Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_2__function_guard o Tuple0))

;; H
  (assert true)

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_0 (us_split_fields3 o))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_1 (us_split_fields3 o))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_2 (us_split_fields3 o))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_3 (us_split_fields3 o))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_4 (us_split_fields3 o))
     (create_type_1 Tuple0)) true))

(define-fun o1 () us_rep1 (create_type_2 Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

;; H
  (assert (create_type_2__function_guard o1 Tuple0))

;; H
  (assert true)

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_0 (us_split_fields3 o1))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_1 (us_split_fields3 o1))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_2 (us_split_fields3 o1))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_3 (us_split_fields3 o1))
     (create_type_1 Tuple0)) true))

;; H
  (assert
  (= (bool_eq (rec__p__type_2__field_4 (us_split_fields3 o1))
     (create_type_1 Tuple0)) true))

(define-fun o2 () us_rep (create_type_1 Tuple0))

;; H
  (assert (create_type_1__function_guard o2 Tuple0))

;; H
  (assert true)

;; H
  (assert (= (to_rep (rec__p__type_1__field_0 (us_split_fields1 o2))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_1 (us_split_fields1 o2))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_2 (us_split_fields1 o2))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_3 (us_split_fields1 o2))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_4 (us_split_fields1 o2))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_5 (us_split_fields1 o2))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_6 (us_split_fields1 o2))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_7 (us_split_fields1 o2))) 0))

(define-fun o3 () us_rep (create_type_1 Tuple0))

;; H
  (assert (create_type_1__function_guard o3 Tuple0))

;; H
  (assert true)

;; H
  (assert (= (to_rep (rec__p__type_1__field_0 (us_split_fields1 o3))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_1 (us_split_fields1 o3))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_2 (us_split_fields1 o3))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_3 (us_split_fields1 o3))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_4 (us_split_fields1 o3))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_5 (us_split_fields1 o3))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_6 (us_split_fields1 o3))) 0))

;; H
  (assert (= (to_rep (rec__p__type_1__field_7 (us_split_fields1 o3))) 0))

(declare-const p__create_type_4__result us_split_fields4)

;; H
  (assert (= p__create_type_4__result (us_split_fieldsqtmk2 o3 o2 o1 o)))

;; H
  (assert (create_type_1__function_guard (create_type_1 Tuple0) Tuple0))

(assert
;; defqtvc
 ;; File "p.ads", line 52, characters 0-0
  (not
  (= (bool_eq (rec__p__type_4__field_0 p__create_type_4__result)
     (create_type_1 Tuple0)) true)))
(check-sat)

(exit)
