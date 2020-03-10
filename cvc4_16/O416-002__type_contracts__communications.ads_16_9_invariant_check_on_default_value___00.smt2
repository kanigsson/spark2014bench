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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep1 (character) Int)

(declare-fun of_rep1 (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                                                 (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                        (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-fun compare ((Array Int character) Int Int (Array Int character) Int
  Int) Int)

;; compare_def_eq
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (! (= (= (compare a a_first a_last b b_first b_last) 0)
     (= (bool_eq a a_first a_last b b_first b_last) true)) :pattern (
  (compare a a_first a_last b b_first b_last)) ))))

;; compare_def_lt
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (! (= (< (compare a a_first a_last b b_first b_last) 0)
     (exists ((i Int) (j Int))
     (and (<= i a_last)
     (and (< j b_last)
     (and (= (bool_eq a a_first i b b_first j) true)
     (or (= i a_last)
     (and (< i a_last)
     (< (to_rep1 (select a (+ i 1))) (to_rep1 (select b (+ j 1))))))))))) :pattern (
  (compare a a_first a_last b b_first b_last)) ))))

;; compare_def_gt
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (! (= (< 0 (compare a a_first a_last b b_first b_last))
     (exists ((i Int) (j Int))
     (and (<= i b_last)
     (and (< j a_last)
     (and (= (bool_eq a a_first j b b_first i) true)
     (or (= i b_last)
     (and (< i b_last)
     (< (to_rep1 (select b (+ i 1))) (to_rep1 (select a (+ j 1))))))))))) :pattern (
  (compare a a_first a_last b b_first b_last)) ))))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-const dummy3 (Array Int character))

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

(declare-fun user_eq3 ((Array Int character) (Array Int character)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__messages__message__sent (Array Int character))(rec__messages__message__received (Array Int character))))))
(define-fun us_split_fields_rec__messages__message__sent__projection ((a us_split_fields)) (Array Int character) 
  (rec__messages__message__sent a))

(define-fun us_split_fields_rec__messages__message__received__projection ((a us_split_fields)) (Array Int character) 
  (rec__messages__message__received a))

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
                        (= (bool_eq
                           (rec__messages__message__sent
                           (us_split_fields1 a)) 1 10
                           (rec__messages__message__sent
                           (us_split_fields1 b)) 1 10) true)
                        (= (bool_eq
                           (rec__messages__message__received
                           (us_split_fields1 a)) 1 10
                           (rec__messages__message__received
                           (us_split_fields1 b)) 1 10) true))
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

(declare-const messages__message__sent__first__bit Int)

(declare-const messages__message__sent__last__bit Int)

(declare-const messages__message__sent__position Int)

;; messages__message__sent__first__bit_axiom
  (assert (<= 0 messages__message__sent__first__bit))

;; messages__message__sent__last__bit_axiom
  (assert
  (< messages__message__sent__first__bit messages__message__sent__last__bit))

;; messages__message__sent__position_axiom
  (assert (<= 0 messages__message__sent__position))

(declare-const messages__message__received__first__bit Int)

(declare-const messages__message__received__last__bit Int)

(declare-const messages__message__received__position Int)

;; messages__message__received__first__bit_axiom
  (assert (<= 0 messages__message__received__first__bit))

;; messages__message__received__last__bit_axiom
  (assert
  (< messages__message__received__first__bit messages__message__received__last__bit))

;; messages__message__received__position_axiom
  (assert (<= 0 messages__message__received__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((message__ref 0))
(((message__refqtmk (message__content us_rep)))))
(define-fun message__ref_message__content__projection ((a message__ref)) us_rep 
  (message__content a))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int us_rep))))))
(declare-fun slide1 ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq1 (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq1 (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq3 ((x us_t)
  (y us_t)) Bool (bool_eq2 (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ((message_arr__ref 0))
(((message_arr__refqtmk (message_arr__content us_t)))))
(define-fun message_arr__ref_message_arr__content__projection ((a message_arr__ref)) us_t 
  (message_arr__content a))

(declare-datatypes ((t4s__ref 0))
(((t4s__refqtmk (t4s__content us_t)))))
(define-fun t4s__ref_t4s__content__projection ((a t4s__ref)) us_t (t4s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__communications__communication__num positive)))))
(define-fun us_split_discrs_rec__communications__communication__num__projection ((a us_split_discrs)) positive 
  (rec__communications__communication__num a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__communications__communication__msgs us_t)))))
(define-fun us_split_fields_rec__communications__communication__msgs__projection ((a us_split_fields2)) us_t 
  (rec__communications__communication__msgs a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq4 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__communications__communication__num
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__communications__communication__num
                                                   (us_split_discrs1 b))))
                         (= (bool_eq3
                            (rec__communications__communication__msgs
                            (us_split_fields3 a))
                            (rec__communications__communication__msgs
                            (us_split_fields3 b))) true))
                    true false))

(define-fun in_range4 ((rec__communications__communication__num1 Int)
  (a us_split_discrs)) Bool (= rec__communications__communication__num1 
  (to_rep (rec__communications__communication__num a))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const communications__communication__num__first__bit Int)

(declare-const communications__communication__num__last__bit Int)

(declare-const communications__communication__num__position Int)

;; communications__communication__num__first__bit_axiom
  (assert (<= 0 communications__communication__num__first__bit))

;; communications__communication__num__last__bit_axiom
  (assert
  (< communications__communication__num__first__bit communications__communication__num__last__bit))

;; communications__communication__num__position_axiom
  (assert (<= 0 communications__communication__num__position))

(declare-const communications__communication__msgs__first__bit Int)

(declare-const communications__communication__msgs__last__bit Int)

(declare-const communications__communication__msgs__position Int)

;; communications__communication__msgs__first__bit_axiom
  (assert (<= 0 communications__communication__msgs__first__bit))

;; communications__communication__msgs__last__bit_axiom
  (assert
  (< communications__communication__msgs__first__bit communications__communication__msgs__last__bit))

;; communications__communication__msgs__position_axiom
  (assert (<= 0 communications__communication__msgs__position))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes ((communication__ref 0))
(((communication__refqtmk (communication__content us_rep1)))))
(define-fun communication__ref_communication__content__projection ((a communication__ref)) us_rep1 
  (communication__content a))

(declare-sort tdayP1 0)

(declare-fun tdayP1qtint (tdayP1) Int)

;; tdayP1'axiom
  (assert
  (forall ((i tdayP1)) (and (<= 1 (tdayP1qtint i)) (<= (tdayP1qtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (tdayP1 tdayP1) Bool)

(declare-const dummy7 tdayP1)

(declare-datatypes ((tdayP1__ref 0))
(((tdayP1__refqtmk (tdayP1__content tdayP1)))))
(define-fun tdayP1__ref_tdayP1__content__projection ((a tdayP1__ref)) tdayP1 
  (tdayP1__content a))

(define-fun dynamic_invariant1 ((temp___expr_214 us_rep1)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (let ((temp___215 (rec__communications__communication__num
                                                       (us_split_discrs1
                                                       temp___expr_214))))
                                     (and
                                     (and (dynamic_property 1
                                     (to_rep temp___215)
                                     (first1
                                     (rec__communications__communication__msgs
                                     (us_split_fields3 temp___expr_214)))
                                     (last1
                                     (rec__communications__communication__msgs
                                     (us_split_fields3 temp___expr_214))))
                                     (and
                                     (= (first1
                                        (rec__communications__communication__msgs
                                        (us_split_fields3 temp___expr_214))) 1)
                                     (= (last1
                                        (rec__communications__communication__msgs
                                        (us_split_fields3 temp___expr_214))) 
                                     (to_rep temp___215))))
                                     (forall ((temp___216 Int))
                                     (=>
                                     (and
                                     (<= (first1
                                         (rec__communications__communication__msgs
                                         (us_split_fields3 temp___expr_214))) temp___216)
                                     (<= temp___216 (last1
                                                    (rec__communications__communication__msgs
                                                    (us_split_fields3
                                                    temp___expr_214)))))
                                     (=> (= temp___is_init_210 true)
                                     (let ((temp___217 (select (to_array
                                                               (rec__communications__communication__msgs
                                                               (us_split_fields3
                                                               temp___expr_214))) temp___216)))
                                     (<= (let ((temp___221 (rec__messages__message__received
                                                           (us_split_fields1
                                                           temp___217))))
                                         (let ((temp___220 (rec__messages__message__sent
                                                           (us_split_fields1
                                                           temp___217))))
                                         (compare temp___220 1 10 temp___221
                                         1 10))) 0))))))))

(define-fun type_invariant ((temp___224 us_rep1)) Bool (forall ((idx Int))
                                                       (=>
                                                       (and (<= 1 idx)
                                                       (<= idx (- (to_rep
                                                                  (rec__communications__communication__num
                                                                  (us_split_discrs1
                                                                  temp___224))) 1)))
                                                       (<= (let ((temp___231 
                                                           (rec__messages__message__received
                                                           (us_split_fields1
                                                           (let ((temp___227 
                                                           (rec__communications__communication__msgs
                                                           (us_split_fields3
                                                           temp___224))))
                                                           (select (to_array
                                                                   temp___227) (+ idx 1)))))))
                                                           (let ((temp___230 
                                                           (rec__messages__message__received
                                                           (us_split_fields1
                                                           (let ((temp___226 
                                                           (rec__communications__communication__msgs
                                                           (us_split_fields3
                                                           temp___224))))
                                                           (select (to_array
                                                                   temp___226) idx))))))
                                                           (compare
                                                           temp___230 1 10
                                                           temp___231 1 10))) 0))))

(define-fun dynamic_invariant2 ((temp___expr_175 us_rep)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=> (= temp___do_toplevel_173 true)
                                     (=> (= temp___is_init_171 true)
                                     (<= (let ((temp___180 (rec__messages__message__received
                                                           (us_split_fields1
                                                           temp___expr_175))))
                                         (let ((temp___179 (rec__messages__message__sent
                                                           (us_split_fields1
                                                           temp___expr_175))))
                                         (compare temp___179 1 10 temp___180
                                         1 10))) 0))))

(define-fun dynamic_predicate ((temp___191 us_rep)) Bool (<= (let ((temp___196 
                                                             (rec__messages__message__received
                                                             (us_split_fields1
                                                             temp___191))))
                                                             (let ((temp___195 
                                                             (rec__messages__message__sent
                                                             (us_split_fields1
                                                             temp___191))))
                                                             (compare
                                                             temp___195 1 10
                                                             temp___196 1 10))) 0))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(assert
;; defqtvc
 ;; File "communications.ads", line 3, characters 0-0
  (not
  (forall ((usf us_rep1))
  (=>
  (exists ((usf1 Int))
  (and (dynamic_invariant usf1 true true true true)
  (exists ((usf2 us_rep1))
  (= (to_rep
     (rec__communications__communication__num (us_split_discrs1 usf2))) usf1))))
  (=> (dynamic_invariant1 usf true false true true)
  (=>
  (and
  (= (first1
     (rec__communications__communication__msgs (us_split_fields3 usf))) 1)
  (= (last1
     (rec__communications__communication__msgs (us_split_fields3 usf))) 
  (to_rep (rec__communications__communication__num (us_split_discrs1 usf)))))
  (type_invariant usf)))))))
(check-sat)
(exit)
