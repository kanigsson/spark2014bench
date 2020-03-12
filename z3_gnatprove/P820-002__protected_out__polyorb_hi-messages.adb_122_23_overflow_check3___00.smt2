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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(declare-sort stream_element 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 8))

(declare-fun user_eq (stream_element stream_element) Bool)

(declare-const dummy stream_element)

(declare-datatypes ()
((stream_element__ref
 (stream_element__refqtmk (stream_element__content stream_element)))))
(define-fun stream_element__ref_stream_element__content__projection ((a stream_element__ref)) stream_element 
  (stream_element__content a))

(declare-fun to_rep (stream_element) (_ BitVec 8))

(declare-fun of_rep ((_ BitVec 8)) stream_element)

;; inversion_axiom
  (assert
  (forall ((x stream_element))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int2 ((x stream_element)) Int (bv2int (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x stream_element)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int stream_element))))))
(declare-fun slide ((Array Int stream_element) Int
  Int) (Array Int stream_element))

;; slide_eq
  (assert
  (forall ((a (Array Int stream_element)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int stream_element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int stream_element)) (a__first Int)
  (a__last Int) (b (Array Int stream_element)) (b__first Int)
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
  (forall ((a (Array Int stream_element)) (b (Array Int stream_element)))
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

(declare-const dummy1 (Array Int stream_element))

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

(declare-fun user_eq1 ((Array Int stream_element)
  (Array Int stream_element)) Bool)

(declare-sort pdu_index 0)

(declare-fun pdu_indexqtint (pdu_index) Int)

;; pdu_index'axiom
  (assert
  (forall ((i pdu_index))
  (and (<= 0 (pdu_indexqtint i)) (<= (pdu_indexqtint i) 19))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 19)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (pdu_index pdu_index) Bool)

(declare-const dummy2 pdu_index)

(declare-datatypes ()
((pdu_index__ref (pdu_index__refqtmk (pdu_index__content pdu_index)))))
(define-fun pdu_index__ref_pdu_index__content__projection ((a pdu_index__ref)) pdu_index 
  (pdu_index__content a))

(define-fun to_rep1 ((x pdu_index)) Int (pdu_indexqtint x))

(declare-fun of_rep1 (Int) pdu_index)

;; inversion_axiom
  (assert
  (forall ((x pdu_index))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x pdu_index)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__ada___polyorb_hi__messages__message_type__content (Array Int stream_element))(rec__ada___polyorb_hi__messages__message_type__first pdu_index)(rec__ada___polyorb_hi__messages__message_type__last pdu_index)))))
(define-fun us_split_fields_rec__ada___polyorb_hi__messages__message_type__content__projection ((a us_split_fields)) (Array Int stream_element) 
  (rec__ada___polyorb_hi__messages__message_type__content a))

(define-fun us_split_fields_rec__ada___polyorb_hi__messages__message_type__first__projection ((a us_split_fields)) pdu_index 
  (rec__ada___polyorb_hi__messages__message_type__first a))

(define-fun us_split_fields_rec__ada___polyorb_hi__messages__message_type__last__projection ((a us_split_fields)) pdu_index 
  (rec__ada___polyorb_hi__messages__message_type__last a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (bool_eq
                           (rec__ada___polyorb_hi__messages__message_type__content
                           (us_split_fields1 a)) 1 19
                           (rec__ada___polyorb_hi__messages__message_type__content
                           (us_split_fields1 b)) 1 19) true)
                        (= (to_rep1
                           (rec__ada___polyorb_hi__messages__message_type__first
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__ada___polyorb_hi__messages__message_type__first
                                                  (us_split_fields1 b)))))
                        (= (to_rep1
                           (rec__ada___polyorb_hi__messages__message_type__last
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__ada___polyorb_hi__messages__message_type__last
                                                  (us_split_fields1 b)))))
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

(declare-const ada___polyorb_hi__messages__message_type__content__first__bit Int)

(declare-const ada___polyorb_hi__messages__message_type__content__last__bit Int)

(declare-const ada___polyorb_hi__messages__message_type__content__position Int)

;; ada___polyorb_hi__messages__message_type__content__first__bit_axiom
  (assert
  (<= 0 ada___polyorb_hi__messages__message_type__content__first__bit))

;; ada___polyorb_hi__messages__message_type__content__last__bit_axiom
  (assert
  (< ada___polyorb_hi__messages__message_type__content__first__bit ada___polyorb_hi__messages__message_type__content__last__bit))

;; ada___polyorb_hi__messages__message_type__content__position_axiom
  (assert (<= 0 ada___polyorb_hi__messages__message_type__content__position))

(declare-const ada___polyorb_hi__messages__message_type__first__first__bit Int)

(declare-const ada___polyorb_hi__messages__message_type__first__last__bit Int)

(declare-const ada___polyorb_hi__messages__message_type__first__position Int)

;; ada___polyorb_hi__messages__message_type__first__first__bit_axiom
  (assert (<= 0 ada___polyorb_hi__messages__message_type__first__first__bit))

;; ada___polyorb_hi__messages__message_type__first__last__bit_axiom
  (assert
  (< ada___polyorb_hi__messages__message_type__first__first__bit ada___polyorb_hi__messages__message_type__first__last__bit))

;; ada___polyorb_hi__messages__message_type__first__position_axiom
  (assert (<= 0 ada___polyorb_hi__messages__message_type__first__position))

(declare-const ada___polyorb_hi__messages__message_type__last__first__bit Int)

(declare-const ada___polyorb_hi__messages__message_type__last__last__bit Int)

(declare-const ada___polyorb_hi__messages__message_type__last__position Int)

;; ada___polyorb_hi__messages__message_type__last__first__bit_axiom
  (assert (<= 0 ada___polyorb_hi__messages__message_type__last__first__bit))

;; ada___polyorb_hi__messages__message_type__last__last__bit_axiom
  (assert
  (< ada___polyorb_hi__messages__message_type__last__first__bit ada___polyorb_hi__messages__message_type__last__last__bit))

;; ada___polyorb_hi__messages__message_type__last__position_axiom
  (assert (<= 0 ada___polyorb_hi__messages__message_type__last__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((message_type__ref (message_type__refqtmk (message_type__content us_rep)))))
(define-fun message_type__ref_message_type__content__projection ((a message_type__ref)) us_rep 
  (message_type__content a))

(declare-fun valid (us_rep) Bool)

(declare-fun valid__function_guard (Bool us_rep) Bool)

(declare-const empty_pdu (Array Int stream_element))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_225 us_rep)
  (temp___skip_top_level_226 Bool)) Bool (and
                                         (and
                                         (= (rec__ada___polyorb_hi__messages__message_type__content
                                            (us_split_fields1
                                            temp___expr_225)) empty_pdu)
                                         (= (to_rep1
                                            (rec__ada___polyorb_hi__messages__message_type__first
                                            (us_split_fields1
                                            temp___expr_225))) 1))
                                         (= (to_rep1
                                            (rec__ada___polyorb_hi__messages__message_type__last
                                            (us_split_fields1
                                            temp___expr_225))) 0)))

(declare-sort tpduP1 0)

(declare-fun tpduP1qtint (tpduP1) Int)

;; tpduP1'axiom
  (assert
  (forall ((i tpduP1)) (and (<= 1 (tpduP1qtint i)) (<= (tpduP1qtint i) 19))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 19)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (tpduP1 tpduP1) Bool)

(declare-const dummy4 tpduP1)

(declare-datatypes ()
((tpduP1__ref (tpduP1__refqtmk (tpduP1__content tpduP1)))))
(define-fun tpduP1__ref_tpduP1__content__projection ((a tpduP1__ref)) tpduP1 
  (tpduP1__content a))

;; valid__post_axiom
  (assert true)

;; valid__def_axiom
  (assert
  (forall ((message us_rep))
  (! (= (= (valid message) true)
     (or
     (= (let ((temp___248 (rec__ada___polyorb_hi__messages__message_type__content
                          (us_split_fields1 message))))
        (bool_eq temp___248 1 19 empty_pdu 1 19)) true)
     (and
     (and
     (<= 1 (to_rep1
           (rec__ada___polyorb_hi__messages__message_type__first
           (us_split_fields1 message))))
     (<= (to_rep1
         (rec__ada___polyorb_hi__messages__message_type__last
         (us_split_fields1 message))) 19))
     (<= (to_rep1
         (rec__ada___polyorb_hi__messages__message_type__first
         (us_split_fields1 message))) (to_rep1
                                      (rec__ada___polyorb_hi__messages__message_type__last
                                      (us_split_fields1 message))))))) :pattern (
  (valid message)) )))

(declare-fun length1 (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_216 Int)
  (temp___is_init_212 Bool) (temp___skip_constant_213 Bool)
  (temp___do_toplevel_214 Bool)
  (temp___do_typ_inv_215 Bool)) Bool (=>
                                     (or (= temp___is_init_212 true)
                                     (<= 0 19)) (in_range temp___expr_216)))

;; length__post_axiom
  (assert
  (forall ((m us_rep))
  (! (and (forall ((m1 us_rep)) (valid__function_guard (valid m1) m1))
     (=> (= (valid m) true)
     (let ((result (length1 m)))
     (=> (length__function_guard result m) (dynamic_invariant result true
     false true true))))) :pattern ((length1 m)) )))

;; length__def_axiom
  (assert
  (forall ((m us_rep))
  (! (= (length1 m) (ite (= (let ((temp___258 (rec__ada___polyorb_hi__messages__message_type__content
                                              (us_split_fields1 m))))
                            (bool_eq temp___258 1 19 empty_pdu 1 19)) true)
                    0
                    (+ (- (to_rep1
                          (rec__ada___polyorb_hi__messages__message_type__last
                          (us_split_fields1 m))) (to_rep1
                                                 (rec__ada___polyorb_hi__messages__message_type__first
                                                 (us_split_fields1 m)))) 1))) :pattern (
  (length1 m)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tstream_element_offsetB 0)

(declare-fun tstream_element_offsetBqtint (tstream_element_offsetB) Int)

;; tstream_element_offsetB'axiom
  (assert
  (forall ((i tstream_element_offsetB))
  (and (<= (- 9223372036854775808) (tstream_element_offsetBqtint i))
  (<= (tstream_element_offsetBqtint i) 9223372036854775807))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (tstream_element_offsetB tstream_element_offsetB) Bool)

(declare-const dummy5 tstream_element_offsetB)

(declare-datatypes ()
((tstream_element_offsetB__ref
 (tstream_element_offsetB__refqtmk
 (tstream_element_offsetB__content tstream_element_offsetB)))))
(define-fun tstream_element_offsetB__ref_tstream_element_offsetB__content__projection ((a tstream_element_offsetB__ref)) tstream_element_offsetB 
  (tstream_element_offsetB__content a))

(declare-const item__first tstream_element_offsetB)

(declare-const item__last tstream_element_offsetB)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun to_rep2 ((x tstream_element_offsetB)) Int (tstream_element_offsetBqtint
                                                      x))

(declare-fun of_rep2 (Int) tstream_element_offsetB)

;; inversion_axiom
  (assert
  (forall ((x tstream_element_offsetB))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x tstream_element_offsetB)) (! (in_range2
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort stream_element_offset 0)

(declare-fun stream_element_offsetqtint (stream_element_offset) Int)

;; stream_element_offset'axiom
  (assert
  (forall ((i stream_element_offset))
  (and (<= (- 9223372036854775808) (stream_element_offsetqtint i))
  (<= (stream_element_offsetqtint i) 9223372036854775807))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (stream_element_offset stream_element_offset) Bool)

(declare-const dummy6 stream_element_offset)

(declare-datatypes ()
((stream_element_offset__ref
 (stream_element_offset__refqtmk
 (stream_element_offset__content stream_element_offset)))))
(define-fun stream_element_offset__ref_stream_element_offset__content__projection ((a stream_element_offset__ref)) stream_element_offset 
  (stream_element_offset__content a))

(declare-sort t 0)

(declare-fun first (t) tstream_element_offsetB)

(declare-fun last (t) tstream_element_offsetB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ()
((us_t (us_tqtmk (elts (Array Int stream_element))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int stream_element) (elts a))

(define-fun of_array ((a (Array Int stream_element)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length2 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq7 (us_t us_t) Bool)

(declare-const dummy7 us_t)

(declare-datatypes ()
((stream_element_array__ref
 (stream_element_array__refqtmk (stream_element_array__content us_t)))))
(define-fun stream_element_array__ref_stream_element_array__content__projection ((a stream_element_array__ref)) us_t 
  (stream_element_array__content a))

(declare-const read_elts Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r15b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r18b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r19b Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(define-fun dynamic_invariant1 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range3 temp___expr_179)))

(declare-sort stream_element_count 0)

(declare-fun stream_element_countqtint (stream_element_count) Int)

;; stream_element_count'axiom
  (assert
  (forall ((i stream_element_count))
  (and (<= 0 (stream_element_countqtint i))
  (<= (stream_element_countqtint i) 9223372036854775807))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (stream_element_count stream_element_count) Bool)

(declare-const dummy8 stream_element_count)

(declare-datatypes ()
((stream_element_count__ref
 (stream_element_count__refqtmk
 (stream_element_count__content stream_element_count)))))
(define-fun stream_element_count__ref_stream_element_count__content__projection ((a stream_element_count__ref)) stream_element_count 
  (stream_element_count__content a))

(define-fun dynamic_invariant2 ((temp___expr_209 Int)
  (temp___is_init_205 Bool) (temp___skip_constant_206 Bool)
  (temp___do_toplevel_207 Bool)
  (temp___do_typ_inv_208 Bool)) Bool (=>
                                     (or (= temp___is_init_205 true)
                                     (<= 0 9223372036854775807)) (in_range4
                                     temp___expr_209)))

(declare-datatypes () ((t13b__ref (t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(declare-datatypes () ((t17b__ref (t17b__refqtmk (t17b__content us_t)))))
(define-fun t17b__ref_t17b__content__projection ((a t17b__ref)) us_t 
  (t17b__content a))

(declare-datatypes () ((t21b__ref (t21b__refqtmk (t21b__content us_t)))))
(define-fun t21b__ref_t21b__content__projection ((a t21b__ref)) us_t 
  (t21b__content a))

(declare-fun temp_____aggregate_def_469 ((_ BitVec 8) Int Int) us_t)

(define-fun dynamic_invariant3 ((temp___expr_186 (_ BitVec 8))
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool) (temp___do_typ_inv_185 Bool)) Bool true)

;; def_axiom
  (assert
  (forall ((temp___471 (_ BitVec 8)))
  (forall ((temp___472 Int) (temp___473 Int))
  (let ((temp___470 (temp_____aggregate_def_469 temp___471 temp___472
                    temp___473)))
  (=> (dynamic_invariant3 temp___471 true true true true)
  (and
  (=> (dynamic_property (- 9223372036854775808) 9223372036854775807
  temp___472 temp___473)
  (and (= (first1 temp___470) temp___472) (= (last1 temp___470) temp___473)))
  (forall ((temp___474 Int))
  (= (to_rep (select (to_array temp___470) temp___474)) temp___471))))))))

(declare-fun ada___polyorb_hi__messages__empty_pdu__aggregate_def ((_ BitVec 8)) (Array Int stream_element))

;; empty_pdu__def_axiom
  (assert
  (= empty_pdu (ada___polyorb_hi__messages__empty_pdu__aggregate_def #x00)))

;; def_axiom
  (assert
  (forall ((temp___156 (_ BitVec 8)))
  (=> (dynamic_invariant3 temp___156 true true true true)
  (forall ((temp___157 Int))
  (= (to_rep
     (select (ada___polyorb_hi__messages__empty_pdu__aggregate_def
             temp___156) temp___157)) temp___156)))))

(define-fun dynamic_invariant4 ((temp___expr_193 us_t)
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (=>
                                     (not (= temp___skip_constant_190 true))
                                     (dynamic_property
                                     (- 9223372036854775808)
                                     9223372036854775807
                                     (first1 temp___expr_193)
                                     (last1 temp___expr_193))))

(declare-const stream__split_fields us_split_fields)

(declare-const last2 Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_property (- 9223372036854775808) 9223372036854775807
  (to_rep2 item__first) (to_rep2 item__last)))

;; Assume
  (assert (dynamic_invariant1 last2 false false true true))

;; H
  (assert
  (forall ((stream__split_fields1 us_split_fields)) (valid__function_guard
  (valid (us_repqtmk stream__split_fields1))
  (us_repqtmk stream__split_fields1))))

;; Assume
  (assert (= (valid (us_repqtmk stream__split_fields)) true))

(define-fun o () us_rep (us_repqtmk stream__split_fields))

(define-fun o1 () Int (length1 o))

;; H
  (assert (length__function_guard o1 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert
  (= o1 (ite (= (bool_eq
                (rec__ada___polyorb_hi__messages__message_type__content
                stream__split_fields) 1 19 empty_pdu 1 19) true)
        0
        (+ (- (to_rep1
              (rec__ada___polyorb_hi__messages__message_type__last
              stream__split_fields)) (to_rep1
                                     (rec__ada___polyorb_hi__messages__message_type__first
                                     stream__split_fields))) 1))))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep2 item__last) o2))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep2 item__first) o3))

(define-fun o4 () Int (length o3 o2))

;; Ensures
  (assert (in_range2 o4))

(define-fun o5 () Int (min o4 o1))

;; Ensures
  (assert (in_range4 o5))

;; Assume
  (assert (= o5 read_elts))

;; Assume
  (assert (dynamic_invariant2 read_elts true false true true))

(declare-const o6 Int)

;; Ensures
  (assert (= (to_rep2 item__last) o6))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep2 item__first) o7))

(define-fun temp___475 () us_t (temp_____aggregate_def_469 #x00 o7 o6))

;; Assume
  (assert (= (first1 temp___475) (to_rep2 item__first)))

;; Assume
  (assert (= (last1 temp___475) (to_rep2 item__last)))

(define-fun temp___477 () us_t (of_array (to_array temp___475)
                               (first1 temp___475) (last1 temp___475)))

;; Assert
  (assert
  (ite (<= (first1 temp___477) (last1 temp___477))
  (and (<= (to_rep2 item__first) (to_rep2 item__last))
  (= (- (last1 temp___477) (first1 temp___477)) (- (to_rep2 item__last) 
  (to_rep2 item__first)))) (< (to_rep2 item__last) (to_rep2 item__first))))

(declare-const o8 Int)

;; Ensures
  (assert (= (to_rep2 item__first) o8))

(declare-const item (Array Int stream_element))

;; H
  (assert (= item (slide (to_array temp___477) (first1 temp___477) o8)))

(declare-const spark__branch Bool)

(declare-const last3 Int)

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (< read_elts 1) true false)))

;; H
  (assert (not (= spark__branch1 true)))

(declare-const o9 Int)

;; Ensures
  (assert (= (to_rep2 item__last) o9))

(declare-const o10 Int)

;; Ensures
  (assert (= (to_rep2 item__first) o10))

;; H
  (assert (in_range2 (length o10 o9)))

;; H
  (assert (= spark__branch (ite (= read_elts (length o10 o9)) true false)))

(declare-const o11 Int)

(declare-const o12 Int)

;; H
  (assert
  (ite (= spark__branch true)
  (and (= (to_rep2 item__last) o12) (= last3 o12))
  (and (= (to_rep2 item__first) o11)
  (let ((o13 (+ o11 read_elts)))
  (and (in_range2 o13)
  (let ((o14 (- o13 1))) (and (in_range2 o14) (= last3 o14))))))))

;; Assume
  (assert (= last3 r15b))

;; Assume
  (assert (dynamic_invariant1 r15b true false true true))

(declare-const ada___polyorb_hi__messages__read__R18b__assume Int)

;; Ensures
  (assert
  (= (to_rep1
     (rec__ada___polyorb_hi__messages__message_type__first
     stream__split_fields)) ada___polyorb_hi__messages__read__R18b__assume))

;; Assume
  (assert (= ada___polyorb_hi__messages__read__R18b__assume r18b))

;; Assume
  (assert (dynamic_invariant r18b true false true true))

(declare-const o13 Int)

;; Ensures
  (assert
  (= (to_rep1
     (rec__ada___polyorb_hi__messages__message_type__first
     stream__split_fields)) o13))

(define-fun o14 () Int (+ o13 read_elts))

;; Ensures
  (assert (in_range2 o14))

;; Assume
  (assert (= (- o14 1) r19b))

;; Assume
  (assert (in_range2 r19b))

;; Assert
  (assert
  (=> (<= r18b r19b)
  (and (and (<= 1 r18b) (<= r18b 19)) (and (<= 1 r19b) (<= r19b 19)))))

(define-fun temp___480 () us_t (of_array
                               (rec__ada___polyorb_hi__messages__message_type__content
                               stream__split_fields) r18b r19b))

;; Assert
  (assert
  (ite (<= (first1 temp___480) (last1 temp___480))
  (and (<= (to_rep2 item__first) r15b)
  (= (- (last1 temp___480) (first1 temp___480)) (- r15b (to_rep2 item__first))))
  (< r15b (to_rep2 item__first))))

(declare-const o15 Int)

;; Ensures
  (assert (= (to_rep2 item__first) o15))

(declare-const o16 Int)

;; Ensures
  (assert (= (to_rep2 item__first) o16))

(define-fun temp___481 () us_t (of_array
                               (slide (to_array temp___480)
                               (first1 temp___480) o16) o15 r15b))

(declare-const temp___482 Int)

;; Ensures
  (assert (= (to_rep2 item__first) temp___482))

;; Assert
  (assert
  (=> (<= temp___482 r15b)
  (and
  (and (<= (to_rep2 item__first) temp___482)
  (<= temp___482 (to_rep2 item__last)))
  (and (<= (to_rep2 item__first) r15b) (<= r15b (to_rep2 item__last))))))

(define-fun temp___483 () us_t (of_array item temp___482 r15b))

;; Assert
  (assert
  (ite (<= (first1 temp___481) (last1 temp___481))
  (and (<= (first1 temp___483) (last1 temp___483))
  (= (- (last1 temp___481) (first1 temp___481)) (- (last1 temp___483) 
  (first1 temp___483)))) (< (last1 temp___483) (first1 temp___483))))

(declare-const usf (Array Int stream_element))

;; Ensures
  (assert
  (forall ((temp___485 Int))
  (ite (and (<= (to_rep2 item__first) temp___485) (<= temp___485 r15b))
  (= (select usf temp___485) (select (to_array temp___481) temp___485))
  (= (select usf temp___485) (select item temp___485)))))

(declare-const o17 Int)

;; Ensures
  (assert
  (= (to_rep1
     (rec__ada___polyorb_hi__messages__message_type__first
     stream__split_fields)) o17))

(define-fun o18 () Int (+ o17 read_elts))

(assert
;; defqtvc
 ;; File "polyorb_hi-messages.ads", line 75, characters 0-0
  (not (in_range2 o18)))
(check-sat)
